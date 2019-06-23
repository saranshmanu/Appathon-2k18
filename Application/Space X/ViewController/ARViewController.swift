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
    
    func configureLighting() {
        sceneView.autoenablesDefaultLighting = true
        sceneView.automaticallyUpdatesLighting = true
    }
    
    func addAugmentedRealityNode(x: Float = 0, y: Float = 0, z: Float = -0.5) {
        guard let plantScene = SCNScene(named: "Bush.dae") else { return }
        let plantNode = SCNNode()
        let plantSceneChildNodes = plantScene.rootNode.childNodes
        for node in plantSceneChildNodes {
            plantNode.addChildNode(node)
        }
        plantNode.position = SCNVector3(x, y, z)
        plantNode.scale = SCNVector3(0.5, 0.5, 0.5)
        sceneView.scene.rootNode.addChildNode(plantNode)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLighting()
        addAugmentedRealityNode()
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

}
