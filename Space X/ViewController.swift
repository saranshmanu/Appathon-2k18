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

    var k = 0
    var j = 0
    
    var selected = 0
    let numberMenu = 5
    
    @IBOutlet weak var letsGoButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func letsGo(_ sender: Any) {
//        timer.invalidate()
        letsGoButton.isHidden = true
        letsGoButton.isEnabled = false
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 10, y: 10)
        }, completion: {(_ finished: Bool) -> Void in
//            UIView.animate(withDuration: 2.0, animations: {() -> Void in
//                self.imageView?.transform = CGAffineTransform(scaleX: 1, y: 1)
//            })
        })
    }
    @IBAction func rotateRight(_ sender: Any) {
        selected = selected + 1
        selected = selected % numberMenu
        if selected >= 0 {
            
        }
        selected = selected % numberMenu
        UIView.animate(withDuration: 0.3) {
            self.circularView.transform = CGAffineTransform(rotationAngle: (CGFloat.pi*2/5)*CGFloat(self.k))
            self.i = self.i + 1
        }
    }
    @IBAction func rotateLeft(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.circularView.transform = CGAffineTransform(rotationAngle: (-CGFloat.pi*2/5)*CGFloat(self.j))
            self.j = self.j - 1
        }
    }
    
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var circularView: UIView!
    
    @objc func animateAstro() {
        UIView.animate(withDuration: 0.6, animations: {() -> Void in
            self.imageView?.transform = CGAffineTransform(scaleX: 1.03, y: 1.03)
        }, completion: {(_ finished: Bool) -> Void in
            UIView.animate(withDuration: 0.6, animations: {() -> Void in
                self.imageView?.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
            })
        })
    }
    
//    let timer = Timer.scheduledTimer(timeInterval: 1.9, target: self, selector: #selector(animateAstro), userInfo: nil, repeats: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thisIsAText.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
        thisIsAText.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }
    
    var i = -1
    
    fileprivate var textArray = [
        "ANGIOSPERM", "GYMNOSPERM", "HYDRA", "HERBS", "STUBBLEROOTS"
    ]
    fileprivate var text: String {
        i = i >= textArray.count - 1 ? 0 : i + 1
        return textArray[i]
    }
    
    @IBOutlet fileprivate var thisIsAText: LTMorphingLabel!

    @IBAction func change(_ sender: Any) {
        animateText()
    }
    
    func animateText() {
        thisIsAText.text = text
        if let effect = LTMorphingEffect(rawValue: 0) {
            thisIsAText.morphingEffect = effect
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
    
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            
            attributedString.addAttribute(NSAttributedStringKey.kern,
                                          value: newValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            
            attributedText = attributedString
        }
        
        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedStringKey.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
}

