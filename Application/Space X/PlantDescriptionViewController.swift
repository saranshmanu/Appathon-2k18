//
//  PlantDescriptionViewController.swift
//  Space X
//
//  Created by Saransh Mittal on 23/06/19.
//  Copyright © 2019 Saransh Mittal. All rights reserved.
//

import UIKit

class PlantDescriptionViewController: UIViewController {
    
    @IBOutlet weak var plantInformationLabel: UILabel!
    @IBOutlet weak var plantDescriptionLabel: UILabel!
    @IBOutlet weak var plantNameLabel: UILabel!
    @IBOutlet weak var environmentPlantImageCollectionView: UICollectionView!
    
    var plantName = ""
    var plantDescription = ""
    var plantInformation = ""
    var images = [String]()
    
    func initLabels() {
        plantNameLabel.text = plantName
        plantDescriptionLabel.text = plantDescription
        plantInformationLabel.text = plantInformation
    }
    
    func initCollectionViewDelegates() {
        environmentPlantImageCollectionView.delegate = self
        environmentPlantImageCollectionView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabels()
        initCollectionViewDelegates()
    }
}

extension PlantDescriptionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "plant", for: indexPath) as! PlantImageCollectionViewCell
        imageViewCell.plantImage.image = UIImage.init(named: images[indexPath.row])
        return imageViewCell
    }
}
