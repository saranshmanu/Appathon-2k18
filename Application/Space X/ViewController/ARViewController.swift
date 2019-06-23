//
//  ARViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 31/03/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit
import ARKit

class ARViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    @IBAction func closeAR(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
        addCar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
//    func addPaperPlane(x: Float = 0, y: Float = 0, z: Float = -0.5) {
//        guard let paperPlaneScene = SCNScene(named: "paperPlane.scn"), let paperPlaneNode = paperPlaneScene.rootNode.childNode(withName: "paperPlane", recursively: true) else { return }
//        paperPlaneNode.position = SCNVector3(x, y, z)
//        sceneView.scene.rootNode.addChildNode(paperPlaneNode)
//    }
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func addCar(x: Float = 0, y: Float = 0, z: Float = -0.5) {
        guard let carScene = SCNScene(named: "Bush1.dae") else { return }
        let carNode = SCNNode()
        let carSceneChildNodes = carScene.rootNode.childNodes
        for childNode in carSceneChildNodes {
            carNode.addChildNode(childNode)
        }
        carNode.position = SCNVector3(x, y, z)
        carNode.scale = SCNVector3(0.5, 0.5, 0.5)
        sceneView.scene.rootNode.addChildNode(carNode)
    }

}
