//
//  PlantCategoryPageViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 23/06/19.
//  Copyright © 2019 Saransh Mittal. All rights reserved.
//

import UIKit

class PlantCategoryPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    fileprivate lazy var pages: [UIViewController] = []
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func newViewController(plantName: String, plantImageName: String, plantDescription: String, plantInformation: String, plantDescriptionImages: [String]) -> MoreInformationPageViewController {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "plantPage") as! MoreInformationPageViewController
        let plantInteractionViewController = self.storyboard?.instantiateViewController(withIdentifier: "upper") as! PlantInteractionViewController
        let plantDescriptionViewController = self.storyboard?.instantiateViewController(withIdentifier: "lower") as! PlantDescriptionViewController
        plantInteractionViewController.plantImageName = plantImageName
        plantInteractionViewController.plantName = plantName
        plantInteractionViewController.plantDescription = plantDescription
        plantDescriptionViewController.plantName = plantName
        plantDescriptionViewController.plantDescription = plantDescription
        plantDescriptionViewController.plantInformation = plantInformation
        plantDescriptionViewController.images = plantDescriptionImages
        viewController.upperPage = plantInteractionViewController
        viewController.lowerPage = plantDescriptionViewController
        return viewController
    }
    
    func initPages() {
        for i in 0...plantDictionary.count-1 {
            let x = plantDictionary[i] as NSDictionary
            let plantName = x["plantName"] as! String
            let plantImageName = x["plantImageName"] as! String
            let plantDescription = x["plantDescription"] as! String
            let plantDescriptionImages = x["plantDescriptionImages"] as! [String]
            let plantInformation = x["plantInformation"] as! String
            pages.append(newViewController(plantName: plantName, plantImageName: plantImageName, plantDescription: plantDescription, plantInformation: plantInformation, plantDescriptionImages: plantDescriptionImages))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate   = self
        initPages()
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PlantCategoryPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)-> UIViewController? {
        let index = pages.index(of: viewController)!
        if index == 0 { return nil }
        let previousIndex = abs((index - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
        let index = pages.index(of: viewController)!
        if index == (pages.count - 1) { return nil }
        let nextIndex = abs((index + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationIndex(for pageViewController: UIPageViewController)-> Int {
        return pages.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
}
