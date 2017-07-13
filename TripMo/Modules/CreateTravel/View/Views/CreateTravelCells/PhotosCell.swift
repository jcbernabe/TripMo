//
//  PhotosCell.swift
//  TripMo
//
//  Created by Hanet on 6/28/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class PhotosCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, CreateTravelCellInterface, PhotosCellDataSource {
    
    weak var createTravelCellDelegate: CreateTravelCellDelegate?

    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// MARK: - Photos Data Source
    func photosCellData() -> [UIImage] {
        return []
    }
    
// MARK: - UIButton selectors
    @IBAction func addPhotoTapped(_ sender: Any) {
        
    }
    
// MARK: - Create necessary cell objects
    func initCreateTravelCell(atIndex: IndexPath) {
        
    }
    
// MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
// MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}
