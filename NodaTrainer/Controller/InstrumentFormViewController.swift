//
//  InstrumentFormViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit

class InstrumentFormViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtDiscount: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtComments: UITextView!
    @IBOutlet weak var imgInstrument: UIImageView!
    
    var imagePicker: UIImagePickerController!
    var indexState: Int!
    
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
    }
    
    @objc func openImagePicker(_ sender: Any) {
        self.present(imagePicker, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addInstrument(_ sender: Any) {
        //guardar Firebase
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
