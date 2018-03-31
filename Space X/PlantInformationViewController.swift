//
//  PlantInformationViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 30/03/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit
import Lottie

var images = ["Sq1", "Sq2", "Sq3"]

class PlantInformationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var pageScrollView: UIScrollView!
    @IBOutlet weak var plantImage: UIImageView!
    private var boatAnimation: LOTAnimationView?
    
    func addParallaxToBackground(){
        let min = CGFloat(-20)
        let max = CGFloat(20)
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        plantImage.addMotionEffect(motionEffectGroup)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collecView.dequeueReusableCell(withReuseIdentifier: "plant", for: indexPath) as! PlantImageCollectionViewCell
        cell.plantImage.image = UIImage.init(named: images[indexPath.row])
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        pageScrollView.scrollToTop()
    }
    
    @IBOutlet weak var collecView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collecView.delegate = self
        collecView.dataSource = self
        boatAnimation = LOTAnimationView(name: "fullstars")
        boatAnimation!.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        boatAnimation!.contentMode = .scaleAspectFit
        boatAnimation!.frame = CGRect(x: 30, y: 0, width: 300, height: 500)
        starView.addSubview(boatAnimation!)
        boatAnimation!.loopAnimation = true
        boatAnimation?.play()
        addParallaxToBackground()
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

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
    /**
     Set x Position:param: x CGFloat
     */
    func setX(x:CGFloat) {
        var frame:CGRect = self.frame
        frame.origin.x = x
        self.frame = frame
    }
    /**
     Set y Position:param: y CGFloat
     */
    func setY(y:CGFloat) {
        var frame:CGRect = self.frame
        frame.origin.y = y
        self.frame = frame
    }
    /**
     Set Width:param: width CGFloat
     */
    func setWidth(width:CGFloat) {
        var frame:CGRect = self.frame
        frame.size.width = width
        self.frame = frame
    }
    /**
     Set Height:param: height CGFloat
     */
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
