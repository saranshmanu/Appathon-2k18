//
//  ViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 30/03/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit
import Lottie
import LTMorphingLabel

class HomeViewController: UIViewController, LTMorphingLabelDelegate {
    
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var selected = 0

    @IBAction func rocketLaunch(_ sender: Any) {
        letsGoButton.isHidden = true
        letsGoButton.isEnabled = false
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 10, y: 10)
        }, completion: {(_ finished: Bool) -> Void in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "page")
            self.present(vc!, animated: true, completion: nil)
        })
    }
    @IBAction func rotateRight(_ sender: Any) {
        selected = (selected + 1) % 5
        animateText(text: textArray[selected], numberOfSpecie: specieNumber[selected])
        let radians:CGFloat = CGFloat(atan2f(Float(circularView.transform.b), Float(circularView.transform.a)))
        let a = radians + CGFloat.pi*2/5
        UIView.animate(withDuration: 0.3) {
            self.circularView.transform = CGAffineTransform(rotationAngle: a)
        }
    }
    @IBAction func rotateLeft(_ sender: Any) {
        selected = selected - 1
        selected = selected % 5
        if selected < 0{
            selected = 4
        }
        animateText(text: textArray[selected], numberOfSpecie: specieNumber[selected])
        let radians:CGFloat = CGFloat(atan2f(Float(circularView.transform.b), Float(circularView.transform.a)))
        let a = radians - CGFloat.pi*2/5
        UIView.animate(withDuration: 0.3) {
            self.circularView.transform = CGAffineTransform(rotationAngle: a)
        }
    }
    
    @IBOutlet weak var numberOfPlants: LTMorphingLabel!
    @IBOutlet weak var specieName: LTMorphingLabel!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var circularView: UIView!
    @IBOutlet fileprivate var plantNameAnimationView: LTMorphingLabel!
    @IBAction func change(_ sender: Any) {
        animateText(text: textArray[selected], numberOfSpecie: specieNumber[selected])
    }

    func animateText(text:String, numberOfSpecie:String) {
        plantNameAnimationView.text = text
        specieName.text = text
        numberOfPlants.text = numberOfSpecie
        if let effect = LTMorphingEffect(rawValue: 0) {
            plantNameAnimationView.morphingEffect = effect
            specieName.morphingEffect = effect
            numberOfPlants.morphingEffect = effect
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView?.transform = CGAffineTransform(scaleX: 10, y: 10)
        plantNameAnimationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        plantNameAnimationView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        animateText(text: textArray[selected], numberOfSpecie: specieNumber[selected])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
    }
}
