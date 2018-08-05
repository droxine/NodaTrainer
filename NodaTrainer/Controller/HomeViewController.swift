//
//  HomeViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 4/29/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func goLogin(_ sender: Any) {
        self.performSegue(withIdentifier: "goLogin", sender: self)
    }
    
    @IBAction func goRegister(_ sender: Any) {
        self.performSegue(withIdentifier: "goRegister", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
