//  Lection0Continue3ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 10/1/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class Lection0Continue3ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var btnDo: UIButton!
    @IBOutlet weak var btnRe: UIButton!
    @IBOutlet weak var btnMi: UIButton!
    @IBOutlet weak var btnFa: UIButton!
    @IBOutlet weak var btnSol: UIButton!
    @IBOutlet weak var btnLa: UIButton!
    @IBOutlet weak var btnTi: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorder(btnDo)
        setBorder(btnRe)
        setBorder(btnMi)
        setBorder(btnFa)
        setBorder(btnSol)
        setBorder(btnLa)
        setBorder(btnTi)
    }
    
    @IBAction func playDo(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playDoSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do#", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playRe(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Re", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playReSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Re#", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playMi(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Mi", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playFa(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Fa", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playFaSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Fa#", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playSol(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Sol", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playSolSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Sol#", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playLa(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"La", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playLaSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"La#", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playTi(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Si", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    func setBorder(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
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
