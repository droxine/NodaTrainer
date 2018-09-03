//
//  InstrumentFormViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase

class InstrumentFormViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtDiscount: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtComments: UITextView!
    @IBOutlet weak var imgInstrument: UIImageView!
    @IBOutlet weak var btnPublish: UIButton!
    @IBOutlet weak var scState: UISegmentedControl!
    
    var imagePicker: UIImagePickerController!
    var indexState: Int!
    
    let databaseRef = Database.database().reference()
    var instrumentId: String!
    
    var instrumentPassed: Instrument!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        imgInstrument.isUserInteractionEnabled = true
        imgInstrument.addGestureRecognizer(imageTap)
        imgInstrument.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        btnPublish.isHidden = false
        scState.selectedSegmentIndex = 0
        indexState = 0
        if instrumentPassed != nil {
            print("instrumentPassed != nil, " + instrumentPassed.name)
            loadSelected()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.layoutIfNeeded()
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
        txtName.text = instrumentPassed.name
        txtStock.text = instrumentPassed.stock
        txtPrice.text = instrumentPassed.price
        txtPhone.text = instrumentPassed.phone
        txtDiscount.text = instrumentPassed.discount
        txtDescription.text = instrumentPassed.description
        txtComments.text = instrumentPassed.comments
        scState.selectedSegmentIndex = instrumentPassed.state
        indexState = scState.selectedSegmentIndex
        let url = URL(string: instrumentPassed.image)
        let data = try? Data(contentsOf: url!)
        if data != nil {
            imgInstrument.image = UIImage(data: data!)
        }
    }
    
    @IBAction func addInstrument(_ sender: Any) {
        //guardar Firebase
        let name = txtName.text
        let stock = txtStock.text
        let price = txtPrice.text
        let phone = txtPhone.text
        let discount = txtDiscount.text
        let description = txtDescription.text
        let comments = txtComments.text
        guard let image = imgInstrument.image else { return }
        
        if((name?.isEmpty)! || (price?.isEmpty)! || (stock?.isEmpty)! || (phone?.isEmpty)!) {
            displayAlertMessage(message: "Ingrese todos los campos obligatorios");
            return;
        }
        
        self.uploadInstrumentImage(image) { url in
            if(url != nil) {
                self.saveClassData(nameValue: name!, stockValue: stock!, priceValue: price!, phoneValue: phone!, discountValue: discount!, descriptionValue: description!, commentsValue: comments!, imageURL: url!) { success in
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Error: No se pudo publicar la venta del instrumento musical")
                        self.displayAlertMessage(message: "No se pudo publicar la venta del instrumento musical")
                    }
                }
            } else {
                self.displayAlertMessage(message: "No se pudo guardar la imagen seleccionada")
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    //uploadImage to Firebase Storage
    func uploadInstrumentImage(_ image: UIImage, completion: @escaping ((_ url:URL?) -> ())) {
        instrumentId = databaseRef.child("instruments").childByAutoId().key
        let storageRef = Storage.storage().reference().child("instruments/\(instrumentId)")
        
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
    
    func saveClassData(nameValue: String, stockValue: String, priceValue: String, phoneValue: String, discountValue: String, descriptionValue: String, commentsValue: String, imageURL: URL, completion: @escaping ((_ success: Bool) -> ()) ) -> Void{
        let instrumentObject = [
            "name": nameValue,
            "stock": stockValue,
            "price": priceValue,
            "phone": phoneValue,
            "discount": discountValue,
            "description": descriptionValue,
            "comments": commentsValue,
            "state": indexState,
            "image": imageURL.absoluteString
            ] as [String:Any]
        let childUpdates = ["/instruments/\(instrumentId)/": instrumentObject]
        databaseRef.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in
            completion(error == nil)
        })
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtName.resignFirstResponder()
        txtStock.resignFirstResponder()
        txtPrice.resignFirstResponder()
        txtPhone.resignFirstResponder()
        txtDiscount.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtComments.resignFirstResponder()
    }
    
    @IBAction func switchState(_ sender: UISegmentedControl) {
        indexState = sender.selectedSegmentIndex
    }
    
}

extension InstrumentFormViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            imgInstrument.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
