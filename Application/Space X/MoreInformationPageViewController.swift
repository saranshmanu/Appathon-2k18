//
//  MoreInformationPageViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 23/06/19.
//  Copyright © 2019 Saransh Mittal. All rights reserved.
//

import UIKit

class MoreInformationPageViewController: UIPageViewController, UIPageViewControllerDelegate {
    
    public var upperPage: UIViewController!
    public var lowerPage: UIViewController!
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            upperPage,
            lowerPage
        ]
        }() as! [UIViewController]
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .vertical, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate   = self
        if let firstVC = pages.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension MoreInformationPageViewController: UIPageViewControllerDataSource {
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
