//
//  PlantInformationViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 30/03/18.
//  Copyright © 2018 Saransh Mittal. All rights reserved.
//

import UIKit

var images = ["Sq1", "Sq2", "Sq3"]

class PlantInformationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collecView.dequeueReusableCell(withReuseIdentifier: "plant", for: indexPath) as! PlantImageCollectionViewCell
        cell.plantImage.image = UIImage.init(named: images[indexPath.row])
        return cell
    }
    

    @IBOutlet weak var collecView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collecView.delegate = self
        collecView.dataSource = self
    }

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
