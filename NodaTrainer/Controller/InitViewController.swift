//
//  InitViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/25/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class InitViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var btnImgProfile: UIButton!
    @IBOutlet weak var btnUpload: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUser.text = ""
        btnUpload.isHidden = true
        imgProfile.isHidden = true
        lblUser.isHidden = true
        loadUser()
        btnUpload.isHidden = false
        imgProfile.isHidden = false
        lblUser.isHidden = false
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(imageTap)
        imgProfile.layer.cornerRadius = imgProfile.bounds.height / 2
        imgProfile.clipsToBounds = true
        
        btnImgProfile.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadUser()
    }
    
    @objc func openImagePicker(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func logOutUser(_ sender: Any) {
        print("button logOut pressed")
        try! Auth.auth().signOut()
        FBSDKLoginManager().logOut()
    }
    
    func loadUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return lblUser.text = ""}
        print(uid)
        let email = Auth.auth().currentUser?.email
        print(email!)
        
        let userProfileRef = Database.database().reference().child("users").child("profile").child(uid)
        print(userProfileRef)
        
        var username: String = ""
        var photoURL: String = ""
        DispatchQueue.global().async {
        userProfileRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let userDict = snapshot.value as? [String:Any] {
                //Do not cast print it directly may be score is Int not string
                print(userDict)
                username = (userDict["username"] as? String)!
                photoURL = (userDict["photoURL"] as? String)!
                print(username)
                print(photoURL)
                
                if !username.isEmpty {
                    self.lblUser.text = username
                }
                if !photoURL.isEmpty {
                    let url = URL(string: photoURL)
                    
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: url!)
                        if data != nil {
                            DispatchQueue.main.async {
                                self.imgProfile.image = UIImage(data: data!)
                            }
                        }
                    }
                }
                
            }
        })}

        if (self.lblUser.text?.isEmpty)! {
            self.lblUser.text = email
        }
    }
    
    
    @IBAction func updateImage(_ sender: Any) {
        guard let image = imgProfile.image else { return}
        let userName = self.lblUser.text
        self.uploadProfileImage(image) { url in
            if(url != nil) {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                changeRequest?.photoURL = url
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print("photoURL added to current user")
                        self.saveProfile(username: userName!, imgProfileURL: url!) { success in
                            if success {
                                self.dismiss(animated: true, completion: nil)
                                self.displayAlertMessageSuccess(message: "Imagen de Perfil actualizada.");
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
    }
    
    //uploadImage to Firebase Storage
    func uploadProfileImage(_ image: UIImage, completion: @escaping ((_ url:URL?) -> ())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("user/\(uid)")
        
        guard let imageData = UIImageJPEGRepresentation(image, 0.15) else { return }
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
    
    func saveProfile(username: String, imgProfileURL: URL, completion: @escaping ((_ success: Bool) -> ())) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let databaseRef = Database.database().reference()
        let userObject = [
            "username": username,
            "photoURL": imgProfileURL.absoluteString
            ] as [String:Any]
        let childUpdates = ["users/profile/\(uid)": userObject]
        databaseRef.updateChildValues(childUpdates) { error, ref in
            completion(error == nil)
        }
        
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessageSuccess(message:String) {
        let alert = UIAlertController(title: "Querido músico:", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
}

extension InitViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
