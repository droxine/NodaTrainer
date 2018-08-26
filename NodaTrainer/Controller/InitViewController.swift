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

class InitViewController: UIViewController {

    @IBOutlet weak var lblUser: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUser.text = ""
        loadUser()
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
        userProfileRef.observeSingleEvent(of: .value, with: { (snapshot) in
            if let userDict = snapshot.value as? [String:Any] {
                //Do not cast print it directly may be score is Int not string
                print(userDict)
                username = (userDict["username"] as? String)!
                print(username)
                
                if !username.isEmpty {
                    self.lblUser.text = username
                }
            }
        })

        if !(self.lblUser.text?.isEmpty)! {
            self.lblUser.text = email
        }
    }

}
