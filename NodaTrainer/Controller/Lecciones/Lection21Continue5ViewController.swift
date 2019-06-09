//
//  Lection21Continue5ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/9/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class Lection21Continue5ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        let sound = Bundle.main.url(forResource:"extra-6-cielito-lindo", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func checkSegundaMayor(_ sender: Any) {
        showMessage(correct: false)
    }
    
    @IBAction func checkSegundaMenor(_ sender: Any) {
        showMessage(correct: false)
    }
    
    @IBAction func checkTerceraMayor(_ sender: Any) {
        showMessage(correct: false)
    }
    
    @IBAction func checkTerceraMenor(_ sender: Any) {
        showMessage(correct: true)
    }
    
    func showMessage(correct:Bool) {
        if(correct) {
            displayAlertMessage(message: "Correcto. Acertó en todo.")
        } else {
            displayAlertMessage(message: "Incorrecto. Debe practicar más")
        }
    }
    
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Resultado", message: message, preferredStyle: UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
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
