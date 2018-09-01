//
//  MusicClassFormViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 8/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit

class MusicClassFormViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtProfessor: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var txtComments: UITextView!
    
    var indexType: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func addMusicClass(_ sender: Any) {
        //guardar firebase
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchType(_ sender: UISegmentedControl) {
        indexType = sender.selectedSegmentIndex
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
