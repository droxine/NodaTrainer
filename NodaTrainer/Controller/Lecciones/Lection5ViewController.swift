//  Lection5ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 9/26/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import AVFoundation

class Lection5ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var btnDo: UIButton!
    @IBOutlet weak var btnRe: UIButton!
    @IBOutlet weak var btnMi: UIButton!
    @IBOutlet weak var btnFa: UIButton!
    @IBOutlet weak var btnSol: UIButton!
    @IBOutlet weak var btnLa: UIButton!
    @IBOutlet weak var btnTi: UIButton!
    @IBOutlet weak var imgResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var labelResult2: UILabel!
    
    @IBOutlet weak var btnReload: UIButton!
    @IBOutlet weak var btnNext: UIButton!
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imgResult.isHidden = true
        labelResult.isHidden = true
        labelResult2.isHidden = true
        btnReload.isHidden = true
        btnNext.isEnabled = false
        notesPressed.removeAll()
        btnSol.backgroundColor = UIColor.white
        btnMi.backgroundColor = UIColor.white
        btnLa.backgroundColor = UIColor.white
        btnFa.backgroundColor = UIColor.white
    }
    
    func setBorder(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func playSound(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"0008 Do, re,  mi, fa, sol, la, 1", withExtension: "mp3")
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
    
    @IBAction func showResults(_ sender: Any) {
        imgResult.isHidden = false
        labelResult.isHidden = false
        labelResult2.isHidden = false
        btnReload.isHidden = false
        btnNext.isEnabled = true
        btnSol.backgroundColor = UIColor.green
        btnMi.backgroundColor = UIColor.green
        btnLa.backgroundColor = UIColor.green
        btnFa.backgroundColor = UIColor.green
        let result = "FaMiSolLa"
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
        btnNext.isEnabled = true
        btnSol.backgroundColor = UIColor.white
        btnMi.backgroundColor = UIColor.white
        btnLa.backgroundColor = UIColor.white
        btnFa.backgroundColor = UIColor.white
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
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goNext(_ sender: Any) {
        
    }
    

}
