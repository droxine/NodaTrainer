//  Lection13Continue3ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 9/28/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class Lection13Continue3ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var btnDo: UIButton!
    @IBOutlet weak var btnRe: UIButton!
    @IBOutlet weak var btnMi: UIButton!
    @IBOutlet weak var btnFa: UIButton!
    @IBOutlet weak var btnSol: UIButton!
    @IBOutlet weak var btnLa: UIButton!
    @IBOutlet weak var btnTi: UIButton!
    @IBOutlet weak var btnDo2: UIButton!
    @IBOutlet weak var btnRe2: UIButton!
    @IBOutlet weak var btnMi2: UIButton!
    @IBOutlet weak var btnFa2: UIButton!
    @IBOutlet weak var btnSol2: UIButton!
    @IBOutlet weak var btnLa2: UIButton!
    @IBOutlet weak var btnTi2: UIButton!
    @IBOutlet weak var btnDo3: UIButton!
    @IBOutlet weak var imgResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResult2: UILabel!
    
    @IBOutlet weak var btnReload: UIButton!
    @IBOutlet weak var btnFinish: UIButton!
    var notesPressed: Array<String> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setBorder(btnDo)
        setBorder(btnRe)
        setBorder(btnMi)
        setBorder(btnFa)
        setBorder(btnSol)
        setBorder(btnLa)
        setBorder(btnTi)
        setBorder(btnDo2)
        setBorder(btnRe2)
        setBorder(btnMi2)
        setBorder(btnFa2)
        setBorder(btnSol2)
        setBorder(btnLa2)
        setBorder(btnTi2)
        setBorder(btnDo3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imgResult.isHidden = true
        labelResult.isHidden = true
        labelResult2.isHidden = true
        btnReload.isHidden = true
        btnFinish.isEnabled = false
        notesPressed.removeAll()
        btnTi2.backgroundColor = UIColor.white
        btnSol2.backgroundColor = UIColor.white
        btnLa2.backgroundColor = UIColor.white
        btnFa2.backgroundColor = UIColor.white
    }
    
    func setBorder(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func playSound(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"0016 4", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func playDo(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Do")
    }
    
    @IBAction func playDoSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do#", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Do#")
    }
    
    @IBAction func playRe(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Re", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Re")
    }
    
    @IBAction func playReSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Re#", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Re#")
    }
    
    @IBAction func playMi(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Mi", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Mi")
    }
    
    @IBAction func playFa(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Fa", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Fa")
    }
    
    @IBAction func playFaSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Fa#", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Fa#")
    }
    
    @IBAction func playSol(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Sol", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Sol")
    }
    
    @IBAction func playSolSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Sol#", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Sol#")
    }
    
    @IBAction func playLa(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"La", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("La")
    }
    
    @IBAction func playLaSharp(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"La#", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("La#")
    }
    
    @IBAction func playTi(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Si", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Si")
    }
    
    @IBAction func playDo2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Do2")
    }
    
    @IBAction func playDoSharp2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do#2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Do#2")
    }
    
    @IBAction func playRe2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Re2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Re2")
    }
    
    @IBAction func playReSharp2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Re#2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Re#2")
    }
    
    @IBAction func playMi2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Mi2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Mi2")
    }
    
    @IBAction func playFa2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Fa2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Fa2")
    }
    
    @IBAction func playFaSharp2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Fa#2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Fa#2")
    }
    
    @IBAction func playSol2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Sol2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Sol2")
    }
    
    @IBAction func playSolSharp2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Sol#2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Sol#2")
    }
    
    @IBAction func playLa2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"La2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("La2")
    }
    
    @IBAction func playLaSharp2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"La#2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("La#2")
    }
    
    @IBAction func playTi2(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Si2", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Si2")
    }
    
    @IBAction func playDo3(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"Do5", withExtension: "mp3")
        reproduceSound(sound!)
        notesPressed.append("Do3")
    }
    
    @IBAction func showResults(_ sender: Any) {
        imgResult.isHidden = false
        labelResult.isHidden = false
        labelResult2.isHidden = false
        btnReload.isHidden = false
        btnFinish.isEnabled = true
        btnTi2.backgroundColor = UIColor.green
        btnSol2.backgroundColor = UIColor.green
        btnLa2.backgroundColor = UIColor.green
        btnFa2.backgroundColor = UIColor.green
        let result = "La2Si2Sol2Fa2"
        var answer: String = ""
        for note in notesPressed {
            answer.append(note)
        }
        print("answer: ", answer)
        if(answer == result) {
            displayAlertMessageSuccess(message: "Felicitaciones. Acertó en todo.")
        } else {
            displayAlertMessage(message: "Incorrecto. Debe practicar más")
        }
    }
    
    @IBAction func reloadLesson(_ sender: Any) {
        notesPressed.removeAll()
        imgResult.isHidden = true
        labelResult.isHidden = true
        labelResult2.isHidden = true
        btnReload.isHidden = true
        btnFinish.isEnabled = true
        btnTi2.backgroundColor = UIColor.white
        btnSol2.backgroundColor = UIColor.white
        btnLa2.backgroundColor = UIColor.white
        btnFa2.backgroundColor = UIColor.white
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
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessage(message:String) {
        let alert = UIAlertController(title: "Vuelva a Intentar", message: message, preferredStyle: UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    //Alert message. Receives the message as a parameter
    func displayAlertMessageSuccess(message:String) {
        let alert = UIAlertController(title: "Querido músico:", message: message, preferredStyle: UIAlertController.Style.alert);
        
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
