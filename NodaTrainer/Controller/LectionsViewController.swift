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
    @IBOutlet weak var imgLection2: UIImageView!
    @IBOutlet weak var imgLection3: UIImageView!
    @IBOutlet weak var imgLection4: UIImageView!
    @IBOutlet weak var imgSong1: UIImageView!
    @IBOutlet weak var imgLection5: UIImageView!
    @IBOutlet weak var imgLection6: UIImageView!
    @IBOutlet weak var imgLection7: UIImageView!
    @IBOutlet weak var imgLection8: UIImageView!
    @IBOutlet weak var imgLection9: UIImageView!
    @IBOutlet weak var imgLection10: UIImageView!
    @IBOutlet weak var imgLection11: UIImageView!
    @IBOutlet weak var imgLection12: UIImageView!
    @IBOutlet weak var imgLection13: UIImageView!
    @IBOutlet weak var imgLection14: UIImageView!
    @IBOutlet weak var imgSong2: UIImageView!
    @IBOutlet weak var imgLection15: UIImageView!
    @IBOutlet weak var imgLection16: UIImageView!
    @IBOutlet weak var imgLection17: UIImageView!
    @IBOutlet weak var imgLection18: UIImageView!
    @IBOutlet weak var imgLection19: UIImageView!
    @IBOutlet weak var imgLection20: UIImageView!
    @IBOutlet weak var imgLection21: UIImageView!
    @IBOutlet weak var imgLection22: UIImageView!
    @IBOutlet weak var imgLection23: UIImageView!
    
    var withoutLessons: Bool = true

    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=false
        FirebaseAPI.sharedInstance.loadSignedInUser(Auth.auth().currentUser)
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
        
        let imageTap2 = UITapGestureRecognizer(target: self, action: #selector(goLection2))
        imgLection2.isUserInteractionEnabled = true
        imgLection2.addGestureRecognizer(imageTap2)
        imgLection2.clipsToBounds = true
        
        let imageTap3 = UITapGestureRecognizer(target: self, action: #selector(goLection3))
        imgLection3.isUserInteractionEnabled = true
        imgLection3.addGestureRecognizer(imageTap3)
        imgLection3.clipsToBounds = true
        
        let imageTap4 = UITapGestureRecognizer(target: self, action: #selector(goLection4))
        imgLection4.isUserInteractionEnabled = true
        imgLection4.addGestureRecognizer(imageTap4)
        imgLection4.clipsToBounds = true
        
        let imageTap5 = UITapGestureRecognizer(target: self, action: #selector(goSong1))
        imgSong1.isUserInteractionEnabled = true
        imgSong1.addGestureRecognizer(imageTap5)
        imgSong1.clipsToBounds = true
        
        let imageTap6 = UITapGestureRecognizer(target: self, action: #selector(goLection5))
        imgLection5.isUserInteractionEnabled = true
        imgLection5.addGestureRecognizer(imageTap6)
        imgLection5.clipsToBounds = true
        
        let imageTap7 = UITapGestureRecognizer(target: self, action: #selector(goLection6))
        imgLection6.isUserInteractionEnabled = true
        imgLection6.addGestureRecognizer(imageTap7)
        imgLection6.clipsToBounds = true
        
        let imageTap8 = UITapGestureRecognizer(target: self, action: #selector(goLection7))
        imgLection7.isUserInteractionEnabled = true
        imgLection7.addGestureRecognizer(imageTap8)
        imgLection7.clipsToBounds = true
        
        let imageTap9 = UITapGestureRecognizer(target: self, action: #selector(goLection8))
        imgLection8.isUserInteractionEnabled = true
        imgLection8.addGestureRecognizer(imageTap9)
        imgLection8.clipsToBounds = true
        
        let imageTap10 = UITapGestureRecognizer(target: self, action: #selector(goLection9))
        imgLection9.isUserInteractionEnabled = true
        imgLection9.addGestureRecognizer(imageTap10)
        imgLection9.clipsToBounds = true
        
        let imageTap11 = UITapGestureRecognizer(target: self, action: #selector(goLection10))
        imgLection10.isUserInteractionEnabled = true
        imgLection10.addGestureRecognizer(imageTap11)
        imgLection10.clipsToBounds = true
        
        let imageTap12 = UITapGestureRecognizer(target: self, action: #selector(goLection11))
        imgLection11.isUserInteractionEnabled = true
        imgLection11.addGestureRecognizer(imageTap12)
        imgLection11.clipsToBounds = true
        
        let imageTap13 = UITapGestureRecognizer(target: self, action: #selector(goLection12))
        imgLection12.isUserInteractionEnabled = true
        imgLection12.addGestureRecognizer(imageTap13)
        imgLection12.clipsToBounds = true
        
        let imageTap14 = UITapGestureRecognizer(target: self, action: #selector(goLection13))
        imgLection13.isUserInteractionEnabled = true
        imgLection13.addGestureRecognizer(imageTap14)
        imgLection13.clipsToBounds = true
        
        let imageTap15 = UITapGestureRecognizer(target: self, action: #selector(goLection14))
        imgLection14.isUserInteractionEnabled = true
        imgLection14.addGestureRecognizer(imageTap15)
        imgLection14.clipsToBounds = true
        
        let imageTap16 = UITapGestureRecognizer(target: self, action: #selector(goSong2))
        imgSong2.isUserInteractionEnabled = true
        imgSong2.addGestureRecognizer(imageTap16)
        imgSong2.clipsToBounds = true
        
        let imageTap17 = UITapGestureRecognizer(target: self, action: #selector(goLection15))
        imgLection15.isUserInteractionEnabled = true
        imgLection15.addGestureRecognizer(imageTap17)
        imgLection15.clipsToBounds = true
        
        let imageTap18 = UITapGestureRecognizer(target: self, action: #selector(goLection16))
        imgLection16.isUserInteractionEnabled = true
        imgLection16.addGestureRecognizer(imageTap18)
        imgLection16.clipsToBounds = true
        
        let imageTap19 = UITapGestureRecognizer(target: self, action: #selector(goLection17))
        imgLection17.isUserInteractionEnabled = true
        imgLection17.addGestureRecognizer(imageTap19)
        imgLection17.clipsToBounds = true
        
        let imageTap20 = UITapGestureRecognizer(target: self, action: #selector(goLection18))
        imgLection18.isUserInteractionEnabled = true
        imgLection18.addGestureRecognizer(imageTap20)
        imgLection18.clipsToBounds = true
        
        let imageTap21 = UITapGestureRecognizer(target: self, action: #selector(goLection19))
        imgLection19.isUserInteractionEnabled = true
        imgLection19.addGestureRecognizer(imageTap21)
        imgLection19.clipsToBounds = true
        
        let imageTap22 = UITapGestureRecognizer(target: self, action: #selector(goLection20))
        imgLection20.isUserInteractionEnabled = true
        imgLection20.addGestureRecognizer(imageTap22)
        imgLection20.clipsToBounds = true
        
        let imageTap23 = UITapGestureRecognizer(target: self, action: #selector(goLection21))
        imgLection21.isUserInteractionEnabled = true
        imgLection21.addGestureRecognizer(imageTap23)
        imgLection21.clipsToBounds = true
        
        let imageTap24 = UITapGestureRecognizer(target: self, action: #selector(goLection22))
        imgLection22.isUserInteractionEnabled = true
        imgLection22.addGestureRecognizer(imageTap24)
        imgLection22.clipsToBounds = true
        
        let imageTap25 = UITapGestureRecognizer(target: self, action: #selector(goLection23))
        imgLection23.isUserInteractionEnabled = true
        imgLection23.addGestureRecognizer(imageTap25)
        imgLection23.clipsToBounds = true
    }
    
    func loadLessonsDone() {
        print("loadLessonsDone")
        //guard let uid = Auth.auth().currentUser?.uid else { return}
        let uid = FirebaseAPI.sharedInstance.retrieveUserId()
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
    
    @objc func goLection2(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection2") as! Lection2ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection3(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection3") as! Lection3ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection4(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection4") as! Lection4ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goSong1(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "song1") as! Song1ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection5(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection5") as! Lection5ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection6(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection6") as! Lection6ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection7(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection7") as! Lection7ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection8(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection8") as! Lection8ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection9(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection9") as! Lection9ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection10(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection10") as! Lection10ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection11(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection11") as! Lection11ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection12(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection12") as! Lection12ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection13(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection13") as! Lection13ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection14(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection14") as! Lection14ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection15(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection15") as! Lection15ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goSong2(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "song2") as! Song2ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection16(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection16") as! Lection16ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection17(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection17") as! Lection17ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection18(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection18") as! Lection18ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection19(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection19") as! Lection19ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection20(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection20") as! Lection20ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection21(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection21") as! Lection21ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection22(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection22") as! Lection22ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @objc func goLection23(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection23") as! Lection23ViewController
        present(controllerTravel, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func showTip(_ sender: Any) {
        let alert = UIAlertController(title: "Tip", message: "A partir de las lecciones con manejo de la segunda escala, se recomienda el uso de un Stylus.", preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        alert.addAction(okAction);
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func startAugmentedReality(_ sender: UIButton) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "pianoAR") as! PianoARViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    
    @IBAction func logOutUser(_ sender: Any) {
        print("button logOut pressed")
        try! Auth.auth().signOut()
        LoginManager().logOut()
    }
    
    

}
