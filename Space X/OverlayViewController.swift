//
//  OverlayViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 31/03/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

class OverlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        lensImage.setHeight(height:900)
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

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var lensImage: UIImageView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
