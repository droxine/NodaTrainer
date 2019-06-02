//
//  Lection15Continue1ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/1/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit

class Lection15Continue1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goNext(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection15Continue2") as! Lection15Continue2ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    

}
