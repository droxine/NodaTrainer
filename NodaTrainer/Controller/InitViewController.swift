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
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUser.text = ""
        loadUser()
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
                
                let url = URL(string: photoURL)
                
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.imgProfile.image = UIImage(data: data!)
                    }
                }
            }
        })}

        if (self.lblUser.text?.isEmpty)! {
            self.lblUser.text = email
        }
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
