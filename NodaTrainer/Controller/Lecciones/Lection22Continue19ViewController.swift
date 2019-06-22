//
//  Lection22Continue19ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/22/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class Lection22Continue19ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var imgResult: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imgResult.isHidden = true
    }
    
    func reproduceSound(_ resource: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: resource)
        } catch {
            print(error)
        }
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        audioPlayer.play()
    }
    
    @IBAction func playSound(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"aristogatos-020", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func showResults(_ sender: Any) {
        imgResult.isHidden = false
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
