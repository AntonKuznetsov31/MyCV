//
//  HobbyDetailCollectionVC.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/22/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "photoCell"

class HobbyDetailCollectionViewController: UICollectionViewController {
    
    // Hobby type
    var hobby = Hobby.MyHobby(rawValue: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // For swipe photos we need to know hobby type and index of photo
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailPhotoSegue" {
            let dvc = segue.destination as! DetailPhotoViewController
            let cell = sender as! HobbyDetailCollectionViewCell
            guard let indexPath = collectionView.indexPath(for: cell) else { return }
            dvc.photoIndex = indexPath.row
            dvc.hobby = hobby
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = hobby?.values().count else { return 0 }
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! HobbyDetailCollectionViewCell
        if let hobbyPhotoNames = hobby?.values() {
            let photo = UIImage(named: hobbyPhotoNames[indexPath.row])
            cell.photoImage.image = photo
        }
        return cell
    }
}
