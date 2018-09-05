//  Lection0Continue2ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 9/4/18.
//  Copyright © 2018 SAM Creators. All rights reserved.
//

import UIKit
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
    
    
    @IBAction func goLessons(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
        controllerTravel.selectedIndex = 1
        present(controllerTravel, animated: true, completion: nil)
    }
    

}
