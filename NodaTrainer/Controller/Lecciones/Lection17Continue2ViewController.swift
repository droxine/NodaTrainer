//
//  Lection17Continue2ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/6/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import AVFoundation

class Lection17Continue2ViewController: UIViewController {

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
        let sound = Bundle.main.url(forResource:"3ra mayor Ascendente", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func checkSegundaMayor(_ sender: Any) {
        showMessage(correct: false)
    }
    
    @IBAction func checkTerceraMayor(_ sender: Any) {
        showMessage(correct: true)
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
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection17Continue3") as! Lection17Continue3ViewController
        present(controllerTravel, animated: true, completion: nil)
    }

}
