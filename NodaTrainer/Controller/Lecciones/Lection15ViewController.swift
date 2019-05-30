//
//  Lection15ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 4/27/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit

class Lection15ViewController: UIViewController {

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
        //let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection15Continue1") as! Lection0Continue1ViewController
        //present(controllerTravel, animated: true, completion: nil)
    }

}
