//  Lection0Continue2ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 9/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
import Firebase
import AVFoundation

class Lection0Continue2ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playNotes(_ sender: Any) {
        let sound = Bundle.main.url(forResource:"0001notas", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: sound!)
        } catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    @IBAction func goBack(_ sender: Any) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goNext(_ sender: Any) {
        if audioPlayer != nil && audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection0Continue3") as! Lection0Continue3ViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    

}
