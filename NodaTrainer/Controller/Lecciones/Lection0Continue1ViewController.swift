//  Lection0Continue1ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 9/3/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit

class Lection0Continue1ViewController: UIViewController {

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
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection0Continue2") as! Lection0Continue2ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    

}
