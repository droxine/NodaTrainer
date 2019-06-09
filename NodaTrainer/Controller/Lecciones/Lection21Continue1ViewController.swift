//
//  Lection21Continue1ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/9/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import AVFoundation

class Lection21Continue1ViewController: UIViewController {

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
        let sound = Bundle.main.url(forResource:"extra-2-yesterday", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func checkSegundaMayor(_ sender: Any) {
        showMessage(correct: true)
    }
    
    @IBAction func checkSegundaMenor(_ sender: Any) {
        showMessage(correct: false)
    }
    
    @IBAction func checkTerceraMayor(_ sender: Any) {
        showMessage(correct: false)
    }
    
    @IBAction func checkTerceraMenor(_ sender: Any) {
        showMessage(correct: false)
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
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goNext(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection21Continue2") as! Lection21Continue2ViewController
        present(controllerTravel, animated: true, completion: nil)
    }

}
