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

class PianoARViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet weak var pianoView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()

        pianoView.delegate = self
        let scene = SCNScene(named: "SceneKit Piano.scnassets/Piano.scn")
        if let node = scene?.rootNode.childNode(withName: "Cube_002", recursively: true) {
            node.position = SCNVector3(0, 0, -1.6)
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pianoView.session.pause()
    }
    

}
