//
//  MainViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 5/1/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit

class LectionsViewController: UIViewController {
    @IBOutlet weak var imgLection0: UIImageView!
    @IBOutlet weak var imgLection1: UIImageView!
    
    var withoutLessons: Bool = true

    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=false
        
        loadLessonsDone()
        
        //lessons navigation
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(goLection0))
        imgLection0.isUserInteractionEnabled = true
        imgLection0.addGestureRecognizer(imageTap)
        imgLection0.clipsToBounds = true
        
        let imageTap1 = UITapGestureRecognizer(target: self, action: #selector(goLection1))
        imgLection1.isUserInteractionEnabled = true
        imgLection1.addGestureRecognizer(imageTap1)
        imgLection1.clipsToBounds = true
    }
    
    func loadLessonsDone() {
        print("loadLessonsDone")
        guard let uid = Auth.auth().currentUser?.uid else { return}
        print(uid)
        
        let lessonsRef = Database.database().reference().child("lessons").child(uid)
        print(lessonsRef)

        lessonsRef.observeSingleEvent(of: .value, with: { (snapshot) in
                if let userDict = snapshot.value as? [String:Any] {
                    print(userDict)
                    self.withoutLessons = !(userDict["done"] as? Bool)!
                    print("done: ",(userDict["done"] as? Bool)!)
                    print("!done: ",!(userDict["done"] as? Bool)!)
                    print("withoutLessons: ",self.withoutLessons)
                }
            if self.withoutLessons {
                self.performSegue(withIdentifier: "goTest", sender: self)
            }
        })
    }
    
    @objc func goLection0(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection0") as! Lection0ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection1(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection1") as! Lection1ViewController
        present(controllerTravel, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func logOutUser(_ sender: Any) {
        print("button logOut pressed")
        try! Auth.auth().signOut()
        FBSDKLoginManager().logOut()
    }
    
    

}
