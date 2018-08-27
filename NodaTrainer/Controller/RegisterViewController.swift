//
//  RegisterViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 4/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPasswordAgain: UITextField!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnChangeProfileImage: UIButton!
    @IBOutlet weak var cboFavoriteInstrument: UITextField!
    @IBOutlet weak var pickerFavoriteInstrument: UIPickerView!
    
    var profileMusicanChecked: Bool = false
    var profileBusinessChecked: Bool = false
    var instrumentsList =  ["Piano", "Violín","Flauta Dulce", "Flauta Traversa", "Oboe", "Clarinete", "Batería", "Guitarra", "Viola", "Banjo", "Ukelele", "Mandolina"]
    
    var imagePicker:UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(imageTap)
        imgProfile.layer.cornerRadius = imgProfile.bounds.height / 2
        imgProfile.clipsToBounds = true
        
        btnChangeProfileImage.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.pickerFavoriteInstrument.isHidden = true
    }
    
    @objc func openImagePicker(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //Enables or disables everytime a user clicks on the checkbox for musician profile
    @IBAction func checkingMusician(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        profileMusicanChecked = sender.isSelected
        print("profileMusicanChecked: \(profileMusicanChecked)")
    }
    
    //Enables or disables everytime a user clicks on the checkbox for business profile
    @IBAction func checkingBusiness(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        profileBusinessChecked = sender.isSelected
        print("profileBusinessChecked: \(profileBusinessChecked)")
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
        self.cboFavoriteInstrument.text = self.instrumentsList[row]
        self.pickerFavoriteInstrument.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField == self.cboFavoriteInstrument) {
            self.pickerFavoriteInstrument.isHidden = false
            textField.endEditing(true)
        }
    }
    
    //When register button is tapped
    @IBAction func registerUser(_ sender: UIButton) {
        let userEmail = txtEmail.text
        let userName = txtUsername.text
        let userPasword = txtPassword.text
        let userPasswordAgain = txtPasswordAgain.text
        let instrument = cboFavoriteInstrument.text
        guard let image = imgProfile.image else { return }
        
        if((userEmail?.isEmpty)! || (userName?.isEmpty)! || (userPasword?.isEmpty)! || (userPasswordAgain?.isEmpty)! || (instrument?.isEmpty)! || !(profileMusicanChecked || profileBusinessChecked)) {
            displayAlertMessage(message: "Ingrese todos los campos");
            return;
        }
        
        if(userPasword != userPasswordAgain) {
            displayAlertMessage(message: "Las contraseñas no coinciden");
            return;
        }
        
        Auth.auth().createUser(withEmail: userEmail!, password: userPasword!) { user, error in
            if error == nil && user != nil {
                print("User created");
                
                self.uploadProfileImage(image) { url in
                    if(url != nil) {
                        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                        changeRequest?.displayName = userName
                        changeRequest?.photoURL = url
                        changeRequest?.commitChanges { error in
                            if error == nil {
                                print("username added to current user")
                                self.saveProfile(username: userName!, imgProfileURL: url!, instrumentValue: instrument!) { success in
                                    if success {
                                        self.dismiss(animated: true, completion: nil)
                                    } else {
                                        print("Error: No se pudo registrar al usuario")
                                        self.displayAlertMessage(message: "No se pudo registrar al usuario")
                                    }
                                }
                            } else {
                                print("Error: \(error!.localizedDescription)")
                                self.displayAlertMessage(message: (error?.localizedDescription)!);
                            }
                        }
                    } else {
                        self.displayAlertMessage(message: "No se pudo guardar la imagen seleccionada")
                    }
                }
                
            } else {
                self.displayAlertMessage(message: (error?.localizedDescription)!);
            }
        }
        
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    //uploadImage to Firebase Storage
    func uploadProfileImage(_ image: UIImage, completion: @escaping ((_ url:URL?) -> ())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.75) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        storageRef.putData(imageData, metadata: metaData) { metaData, error in
            if error == nil, metaData != nil {
                storageRef.downloadURL { url, error in
                    if error == nil, url != nil {
                        if let newUrl = url {
                            completion(newUrl)
                        } else {
                            print("newUrl error \(error!.localizedDescription)")
                            completion(nil)
                        }
                    } else {
                        print("error is not nil or url is nil, error \(error!.localizedDescription)")
                        completion(nil)
                    }
                }
            } else {
                print("metadata is nil or error is not nil, error \(error!.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    func saveProfile(username: String, imgProfileURL: URL, instrumentValue: String, completion: @escaping ((_ success: Bool) -> ()) ) -> Void{
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let databaseRef = Database.database().reference()
        /*let keyMusician = databaseRef.child("profiles").childByAutoId().key
        let profileMusician = [
            "uid": uid,
            "name": "Músico",
            "enabled": profileMusicanChecked,
        ] as [String:Any]
        let keyBusiness = databaseRef.child("profiles").childByAutoId().key
        let profileBusiness = [
            "uid": uid,
            "name": "Negocio",
            "enabled": profileBusinessChecked,
            ] as [String:Any]
        let keyInstruments = databaseRef.child("instruments").childByAutoId().key
        let instrument = [
            "uid": uid,
            "name": instrumentValue
            ] as [String:Any]*/
        let userProfile = [
            "enabledMusician": profileMusicanChecked,
            "enabledBusiness": profileBusinessChecked,
            "favoriteInstrument": instrumentValue
            ] as [String:Any]
        let userObject = [
            "username": username,
            "photoURL": imgProfileURL.absoluteString
        ] as [String:Any]
        let childUpdates = ["/user-profiles/\(uid)/": userProfile,
                            "users/profile/\(uid)": userObject]
        databaseRef.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in
            completion(error == nil)
        })
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //To disappear the keyboard on touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtEmail.resignFirstResponder()
        txtUsername.resignFirstResponder()
        txtPassword.resignFirstResponder()
        txtPasswordAgain.resignFirstResponder()
        pickerFavoriteInstrument.resignFirstResponder()
    }

}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            imgProfile.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
