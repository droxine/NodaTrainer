//
//  UpdateProfileViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/26/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class UpdateProfileViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtFavoriteInstrument: UITextField!
    @IBOutlet weak var pickerFavoriteInstrument: UIPickerView!
    
    @IBOutlet weak var btnMusician: UIButton!
    @IBOutlet weak var btnBusiness: UIButton!
    
    
    var profileMusicanChecked: Bool = false
    var profileBusinessChecked: Bool = false
    var instrumentsList =  ["Piano", "Violín","Flauta Dulce", "Flauta Traversa", "Oboe", "Clarinete", "Batería", "Guitarra", "Viola", "Banjo", "Ukelele", "Mandolina"]
    var photoURL: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerFavoriteInstrument.isHidden = true
        let backButton = UIBarButtonItem()
        backButton.title = "Volver"
        self.navigationController!.navigationBar.topItem!.backBarButtonItem = backButton
        loadUser()
    }
    
    @IBAction func checkingMusician(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        profileMusicanChecked = sender.isSelected
        print("profileMusicanChecked: \(profileMusicanChecked)")
    }
    
    @IBAction func checkingBusiness(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        profileBusinessChecked = sender.isSelected
        print("profileBusinessChecked: \(profileBusinessChecked)")
    }
    
    func loadUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return}
        print(uid)
        
        let userProfileRef = Database.database().reference().child("users").child("profile").child(uid)
        print(userProfileRef)
        
        var username: String = ""
        DispatchQueue.global().async {
            userProfileRef.observeSingleEvent(of: .value, with: { (snapshot) in
                if let userDict = snapshot.value as? [String:Any] {
                    print(userDict)
                    username = (userDict["username"] as? String)!
                    self.photoURL = (userDict["photoURL"] as? String)!
                    print(username)
                    print(self.photoURL)
                    
                    if !username.isEmpty {
                        self.txtUsername.text = username
                    }
                    
                }
        })}
        
        let userprofilesRef = Database.database().reference().child("user-profiles").child(uid)
        print(userprofilesRef)
        
        var musician: Bool = false
        var business: Bool = false
        var instrument: String = ""
        
        DispatchQueue.global().async {
            userprofilesRef.observeSingleEvent(of: .value, with: { (snapshot) in
                if let userDict = snapshot.value as? [String:Any] {
                    print(userDict)
                    musician = (userDict["enabledMusician"] as? Bool)!
                    business = (userDict["enabledBusiness"] as? Bool)!
                    instrument = (userDict["favoriteInstrument"] as? String)!
                    print(musician)
                    print(business)
                    print(instrument)
                    
                    self.btnMusician.isSelected = musician
                    self.profileMusicanChecked = musician
                    self.btnBusiness.isSelected = business
                    self.profileBusinessChecked = business
                    
                    if !instrument.isEmpty {
                        self.txtFavoriteInstrument.text = instrument
                    }
                    
                }
        })}
    }
    
    @IBAction func updateProfile(_ sender: Any) {
        if((self.txtUsername.text?.isEmpty)! || (self.txtFavoriteInstrument.text?.isEmpty)! || !(profileMusicanChecked || profileBusinessChecked)) {
            displayAlertMessage(message: "Ingrese todos los campos");
            return;
        }
        
        self.saveProfile() { success in
            if success {
                self.displayAlertMessageSuccess(message: "Sus datos han sido actualizados.");
            } else {
                print("Error: No se pudo actualizar al usuario")
                self.displayAlertMessage(message: "Los datos no se pudieron actualizar.")
            }
        }
    }
    
    func saveProfile(completion: @escaping ((_ success: Bool) -> ()) ) -> Void{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let databaseRef = Database.database().reference()
        let userProfile = [
            "enabledMusician": profileMusicanChecked,
            "enabledBusiness": profileBusinessChecked,
            "favoriteInstrument": self.txtFavoriteInstrument.text!
            ] as [String:Any]
        let userObject = [
            "username": self.txtUsername.text!,
            "photoURL": photoURL
            ] as [String:Any]
        let childUpdates = ["/user-profiles/\(uid)/": userProfile,
                            "users/profile/\(uid)": userObject]
        databaseRef.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in
            completion(error == nil)
        })
    }

    
    //Functions for joining the TextField with the PickerView for the instruments
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return instrumentsList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.view.endEditing(true)
        return instrumentsList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.txtFavoriteInstrument.text = self.instrumentsList[row]
        self.pickerFavoriteInstrument.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.txtFavoriteInstrument) {
            self.pickerFavoriteInstrument.isHidden = false
            textField.endEditing(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //To disappear the keyboard on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtUsername.resignFirstResponder()
        txtFavoriteInstrument.resignFirstResponder()
        pickerFavoriteInstrument.resignFirstResponder()
    }
    
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        alert.addAction(okAction);
        self.present(alert, animated: true, completion: nil);
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessageSuccess(message:String) {
        let alert = UIAlertController(title: "Querido músico:", message: message, preferredStyle: UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }

}
