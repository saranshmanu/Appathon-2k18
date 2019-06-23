//
//  PlantInteractionViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 23/06/19.
//  Copyright © 2019 Saransh Mittal. All rights reserved.
//

import UIKit
import Lottie

class PlantInteractionViewController: UIViewController {

    @IBOutlet weak var plantDescriptionLabel: UILabel!
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var plantImageView: UIImageView!
    @IBOutlet weak var starNightAnimation: UIView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sunImage: UIImageView!
    
    private var nightAnimation: LOTAnimationView?
    
    var plantName: String = ""
    var plantImageName: String = ""
    var plantDescription: String = ""
    
    func addParallaxToBackground(){
        let min = CGFloat(-50)
        let max = CGFloat(50)
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        plantImageView.addMotionEffect(motionEffectGroup)
    }
    
    func initStartNightAnimation() {
        nightAnimation = LOTAnimationView(name: "star")
        nightAnimation!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        nightAnimation!.contentMode = .scaleAspectFit
        nightAnimation!.frame = CGRect(x: 30, y: 0, width: 300, height: 500)
        starNightAnimation.addSubview(nightAnimation!)
        nightAnimation!.loopAnimation = true
        nightAnimation?.play()
        self.view.layoutIfNeeded()
    }
    
    func initSunMovingAnimation() {
        sunImage.setHeight(height:900)
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 6, animations: {() -> Void in
            self.view.layoutIfNeeded()
            self.heightConstraint.constant = 500
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 6, animations: {() -> Void in
                self.heightConstraint.constant = 900
                self.view.layoutIfNeeded()
            }, completion: {(_ finished: Bool) -> Void in
                UIView.animate(withDuration: 6, animations: {() -> Void in
                    self.heightConstraint.constant = 500
                    self.view.layoutIfNeeded()
                }, completion: {(_ finished: Bool) -> Void in
                    UIView.animate(withDuration: 6, animations: {() -> Void in
                        self.heightConstraint.constant = 900
                        self.view.layoutIfNeeded()
                    }, completion: {(_ finished: Bool) -> Void in
                        UIView.animate(withDuration: 6, animations: {() -> Void in
                            self.heightConstraint.constant = 500
                            self.view.layoutIfNeeded()
                        }, completion: {(_ finished: Bool) -> Void in
                            UIView.animate(withDuration: 6, animations: {() -> Void in
                                self.heightConstraint.constant = 900
                                self.view.layoutIfNeeded()
                            })
                        })
                    })
                })
            })
        })
    }
    
    func initLabels() {
        plantImageView.image = UIImage.init(named: plantImageName)
        plantNameLabel.text = plantName
        plantDescriptionLabel.text = plantDescription
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabels()
        initStartNightAnimation()
        initSunMovingAnimation()
        addParallaxToBackground()
    }
}
