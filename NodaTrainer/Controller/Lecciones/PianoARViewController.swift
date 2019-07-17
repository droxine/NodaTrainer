//
//  PianoARViewController.swift
//  NodaTrainer
//
//  Created by sangeles on 2/24/19.
//  Copyright © 2019 SAM Creators. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import AVFoundation

class PianoARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var pianoView: ARSCNView!
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        pianoView.delegate = self
        let scene = SCNScene(named: "SceneKit Piano.scnassets/Piano.scn")
        if let node = scene?.rootNode.childNode(withName: "Cube_002", recursively: true) {
            node.position = SCNVector3(0, 0, -1.4)
            node.scale = .init(0.80, 0.80, 0.80)
            pianoView.scene.rootNode.addChildNode(node)
        }
        
        pianoView.autoenablesDefaultLighting = true


    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if ARWorldTrackingConfiguration.isSupported {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal, .vertical]
            pianoView.session.run(configuration)
        } else {
            let alert = UIAlertController(title: "Dispositivo no soportado", message: "Su dispostivio no soporta el ARKit para Realidad Aumentada bajo la configuración ARWorldTrackingConfiguration.", preferredStyle: UIAlertController.Style.alert);
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
            
            alert.addAction(okAction);
            self.present(alert, animated: true, completion: nil);
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let results = pianoView.hitTest(touch.location(in: pianoView), types: [ARHitTestResult.ResultType.featurePoint])
        guard let hitFeature = results.last else { return }
        let notes = ["Do","Re","Mi","Fa","Sol","La","Si",
                     "Do2","Re2","Mi2","Fa2","Sol2","La2","Si2","Do5"]
        let randomNote : Int = Int(arc4random_uniform(15))
        let sound = Bundle.main.url(forResource:notes[randomNote], withExtension: "mp3")
        reproduceSound(sound!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pianoView.session.pause()
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

}
