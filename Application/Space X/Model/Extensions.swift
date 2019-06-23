//
//  Extensions.swift
//  Space X
//
//  Created by Saransh Mittal on 23/06/19.
//  Copyright © 2019 Saransh Mittal. All rights reserved.
//

import UIKit

class FadeSegue: UIStoryboardSegue {
    var placeholderView: UIViewController?
    override func perform() {
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        if let placeholder = placeholderView {
            placeholder.view.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
            placeholder.view.alpha = 0
            source.view.addSubview(placeholder.view)
            UIView.animate(withDuration: 0.4, animations: {
                placeholder.view.alpha = 1
            }, completion: { (finished) in
                self.source.present(self.destination, animated: false, completion: {
                    placeholder.view.removeFromSuperview()
                })
            })
        } else {
            self.destination.view.alpha = 0.0
            self.source.present(self.destination, animated: false, completion: {
                UIView.animate(withDuration: 0.4, animations: {
                    self.destination.view.alpha = 1.0
                })
            })
        }
    }
}

extension UIView {
    func setX(x:CGFloat) {
        var frame:CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    func setY(y:CGFloat) {
        var frame:CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    func setWidth(width:CGFloat) {
        var frame:CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    func setHeight(height:CGFloat) {
        var frame:CGRect = self.frame
        frame.size.height = height
        self.frame = frame
    }
}

extension UIScrollView {
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
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
