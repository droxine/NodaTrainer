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
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem.init(title: "Volver a Lecciones", style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.goLessons(_:)))
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden=false
        pianoView.delegate = self
        let scene = SCNScene(named: "SceneKit Piano.scnassets/Piano.scn")
        /*let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.lightGray
        cube.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -0.5)
        node.geometry = cube*/
        if let node = scene?.rootNode.childNode(withName: "Cube_002", recursively: true) {
            node.position = SCNVector3(0, 0, -1.6)
            //pianoView.scene = scene!
            pianoView.scene.rootNode.addChildNode(node)
        }
        
        //pianoView.scene.rootNode.addChildNode(node)
        pianoView.autoenablesDefaultLighting = true
        
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 375, height: 80))
        navigationBar.barTintColor = UIColor.lightGray
        let navigationItem = UINavigationItem()
        //let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(goLessons))
        //doneButton = UIBarButtonItem.init(title: "Volver a Lecciones",  style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.goLessons))
        UIBarButtonItem.appearance().setTitlePositionAdjustment(UIOffset.init(horizontal: 6, vertical: 33), for: UIBarMetrics.default)
        navigationItem.rightBarButtonItem = doneButton
        navigationBar.items = [navigationItem]
        navigationBar.prefersLargeTitles = true
        view.addSubview(navigationBar)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if ARWorldTrackingConfiguration.isSupported {
            //let configuration = ARWorldTrackingConfiguration.init()
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal, .vertical]
            //pianoView.session.run(configuration, options: ARSession.RunOptions.resetTracking)
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
    
    @objc func goLessons(_ sender:UIBarButtonItem!) {
        let controllerTravel = self.storyboard?.instantiateViewController(withIdentifier: "LectionsViewController") as! LectionsViewController
        present(controllerTravel, animated: true, completion: nil)
    }
    

}
