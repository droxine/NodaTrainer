//
//  Lection19ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/8/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import AVFoundation

class Lection19ViewController: UIViewController {

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
        let sound = Bundle.main.url(forResource:"5ta disminuida", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func checkQuintaDisminuida(_ sender: Any) {
        showMessage(correct: true)
    }
    
    @IBAction func checkQuintaSubdisminuida(_ sender: Any) {
        showMessage(correct: false)
    }
    
    func showMessage(correct:Bool) {
        if(correct) {
            displayAlertMessage(message: "Felicitaciones. Acertó en todo.")
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
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection19Continue1") as! Lection19Continue1ViewController
        present(controllerTravel, animated: true, completion: nil)
    }

}
