//
//  MusicClassFormViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase

class MusicClassFormViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtProfessor: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtComments: UITextView!
    @IBOutlet weak var imgClass: UIImageView!
    @IBOutlet weak var btnPublish: UIButton!
    @IBOutlet weak var scType: UISegmentedControl!
    
    var imagePicker: UIImagePickerController!
    var indexType: Int!
    
    let databaseRef = Database.database().reference()
    var musicClassId: String!
    
    var musicClassPassed: MusicClass!
    
    override func viewDidLoad() {
        print("MusicClassController")
        print("viewDidLoad")
        super.viewDidLoad()
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        imgClass.isUserInteractionEnabled = true
        imgClass.addGestureRecognizer(imageTap)
        imgClass.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        btnPublish.isHidden = false
        scType.selectedSegmentIndex = 0
        indexType = 0
        if musicClassPassed != nil {
            print("musicClassPassed != nil, " + musicClassPassed.title)
            loadSelected()
        }
    }
    
    @objc func openImagePicker(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadSelected() {
        print("loadSelected")
        btnPublish.isHidden = true
        txtTitle.text = musicClassPassed.title
        txtPrice.text = musicClassPassed.price
        txtProfessor.text = musicClassPassed.professor
        txtPhone.text = musicClassPassed.phone
        txtDescription.text = musicClassPassed.description
        txtComments.text = musicClassPassed.comments
        scType.selectedSegmentIndex = musicClassPassed.type
        indexType = scType.selectedSegmentIndex
        let url = URL(string: musicClassPassed.image)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            imgClass.image = UIImage(data: data!)
        }
    }
    
    @IBAction func addMusicClass(_ sender: Any) {
        //guardar firebase
        let title = txtTitle.text
        let price = txtPrice.text
        let professor = txtProfessor.text
        let phone = txtPhone.text
        let description = txtDescription.text
        let comments = txtComments.text
        guard let image = imgClass.image else { return }
        
        if((title?.isEmpty)! || (price?.isEmpty)! || (professor?.isEmpty)! || (phone?.isEmpty)!) {
            displayAlertMessage(message: "Ingrese todos los campos obligatorios");
            return;
        }
        
        self.uploadClassImage(image) { url in
            if(url != nil) {
                self.saveClassData(titleValue: title!, priceValue: price!, professorValue: professor!, phoneValue: phone!, descriptionValue: description!, commentsValue: comments!, imageURL: url!) { success in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Error: No se pudo publicar la clase de música")
                        self.displayAlertMessage(message: "No se pudo publicar la clase de música")
                    }
                }
            } else {
                self.displayAlertMessage(message: "No se pudo guardar la imagen seleccionada")
            }
        }
    }
    
    //uploadImage to Firebase Storage
    func uploadClassImage(_ image: UIImage, completion: @escaping ((_ url:URL?) -> ())) {
        musicClassId = databaseRef.child("classes").childByAutoId().key
        let storageRef = Storage.storage().reference().child("classes/\(String(describing: musicClassId))")
        
        //guard let imageData = UIImageJPEGRepresentation(image, 0.15) else { return }
        guard let imageData = image.jpegData(compressionQuality: 0.15) else { return }

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
    
    func saveClassData(titleValue: String, priceValue: String, professorValue: String, phoneValue: String, descriptionValue: String, commentsValue: String, imageURL: URL, completion: @escaping ((_ success: Bool) -> ()) ) -> Void{
        let classesObject = [
            "title": titleValue,
            "price": priceValue,
            "professor": professorValue,
            "phone": phoneValue,
            "description": descriptionValue,
            "comments": commentsValue,
            "type": indexType,
            "image": imageURL.absoluteString
            ] as [String:Any]
        let childUpdates = ["/classes/\(String(describing: musicClassId))/": classesObject]
        databaseRef.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in
            completion(error == nil)
        })
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchType(_ sender: UISegmentedControl) {
        indexType = sender.selectedSegmentIndex
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtTitle.resignFirstResponder()
        txtPrice.resignFirstResponder()
        txtProfessor.resignFirstResponder()
        txtPhone.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtComments.resignFirstResponder()
    }

}

extension MusicClassFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imgClass.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
