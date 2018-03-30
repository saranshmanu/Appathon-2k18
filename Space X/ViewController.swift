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

class ViewController: UIViewController, LTMorphingLabelDelegate {
    
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var selected = 0
    
    @IBAction func letsGo(_ sender: Any) {
//        timer.invalidate()
        letsGoButton.isHidden = true
        letsGoButton.isEnabled = false
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 10, y: 10)
        }, completion: {(_ finished: Bool) -> Void in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "plantInformation") as! PageViewController
            self.present(vc, animated: true, completion: nil)
        })
    }
    @IBAction func rotateRight(_ sender: Any) {
        selected = selected + 1
        selected = selected % 5
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
    
    func astro() {
        UIView.animate(withDuration: 0.6, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 1.03, y: 1.03)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.6, animations: {() -> Void in
                self.imageView?.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            })
        })
    }
    
//    let timer = Timer.scheduledTimer(timeInterval: 1.9, target: self, selector: #selector(ViewController.astro), userInfo: nil, repeats: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thisIsAText.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        thisIsAText.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        animateText(text: textArray[selected], numberOfSpecie: specieNumber[selected])
    }
    
    var i = -1
    
    fileprivate var textArray = [
        "ANGIOSPERM", "GYMNOSPERM", "HYDRA", "HERBS", "STUBBLEROOTS"
    ]
    fileprivate var specieNumber = [
        "5 SPECIES", "10 SPECIES", "1 SPECIE", "3 SPECIES", "7 SPECIES"
    ]
    
    @IBOutlet fileprivate var thisIsAText: LTMorphingLabel!

    @IBAction func change(_ sender: Any) {
        animateText(text: textArray[selected], numberOfSpecie: specieNumber[selected])
    }
    
    func animateText(text:String, numberOfSpecie:String) {
        thisIsAText.text = text
        specieName.text = text
        numberOfPlants.text = numberOfSpecie
        if let effect = LTMorphingEffect(rawValue: 0) {
            thisIsAText.morphingEffect = effect
            specieName.morphingEffect = effect
            numberOfPlants.morphingEffect = effect
        }
    }
}

extension ViewController {
    func morphingDidStart(_ textLabel: LTMorphingLabel) {
    }
    func morphingDidComplete(_ textLabel: LTMorphingLabel) {
    }
    func morphingOnProgress(_ textLabel: LTMorphingLabel, progress: Float) {
    }
}

extension UILabel {
    
    @IBInspectable var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            attributedString.addAttribute(NSAttributedStringKey.kern, value: newValue, range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        } get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedStringKey.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}

