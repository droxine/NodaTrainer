//
//  Lection15Continue2ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/1/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import Firebase

class Lection15Continue2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func completeLesson(_ sender: Any) {
        saveLessonsDone() { success in
            if !success {
                print("Error: No se pudo actualizar el fin de la leccion")
            }
        }
        
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
        controllerTravel.selectedIndex = 1
        present(controllerTravel, animated: true, completion: nil)
    }
    
    func saveLessonsDone(completion: @escaping ((_ success: Bool) -> ()) ) -> Void{
        guard let uid = Auth.auth().currentUser?.uid else { return}
        print(uid)
        let lessonsObject = [
            "done": true
            ] as [String:Any]
        let childUpdates = ["/lessons/\(uid)/": lessonsObject]
        Database.database().reference().updateChildValues(childUpdates, withCompletionBlock: { (error, ref) in
            completion(error == nil)
        })
    }

}
