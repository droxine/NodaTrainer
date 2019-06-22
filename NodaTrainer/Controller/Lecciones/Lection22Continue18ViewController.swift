//
//  Lection22Continue18ViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 6/22/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import AVFoundation

class Lection22Continue18ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet weak var imgResult: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        imgResult.isHidden = true
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
        let sound = Bundle.main.url(forResource:"aristogatos-019", withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    @IBAction func showResults(_ sender: Any) {
        imgResult.isHidden = false
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goNext(_ sender: Any) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "lection22Continue19") as! Lection22Continue19ViewController
        present(controllerTravel, animated: true, completion: nil)
    }

}
