//  Lection1ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 9/5/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import AVFoundation

class Lection1ViewController: UIViewController {

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBorder(btnDo)
        setBorder(btnRe)
        setBorder(btnMi)
        setBorder(btnFa)
        setBorder(btnSol)
        setBorder(btnLa)
        setBorder(btnTi)
        imgResult.isHidden = true
        labelResult.isHidden = true
        labelResult2.isHidden = true
    }
    
    func setBorder(_ button: UIButton) {
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSound(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"0003 Do, mi 1", withExtension: "mp3")
        reproduceSound(sound!)
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
    
    func reproduceSound(_ resource: URL) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: resource)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func showResults(_ sender: Any) {
        imgResult.isHidden = false
        labelResult.isHidden = false
        labelResult2.isHidden = false
        btnDo.backgroundColor = UIColor.green
        btnMi.backgroundColor = UIColor.green
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
