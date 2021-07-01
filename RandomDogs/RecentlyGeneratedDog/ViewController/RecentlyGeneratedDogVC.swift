//
//  RecentlyGeneratedDogVC.swift
//  RandomDogs
//
//  Created by Farooque Azam on 01/07/21.
//

import UIKit

class RecentlyGeneratedDogVC: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var lruImageData : [Data] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lru = UserDefaults.standard.value(forKey: "SavedImageData") as? [Data] {
            self.lruImageData = lru
            registerCell()
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.reloadData()
        }
    }
    
    private func registerCell() {
        let nib = UINib(nibName: RecentlyGeneratedDogsCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: RecentlyGeneratedDogsCollectionViewCell.identifier)
        
    }
}


extension RecentlyGeneratedDogVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lruImageData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyGeneratedDogsCollectionViewCell.identifier, for: indexPath) as! RecentlyGeneratedDogsCollectionViewCell
        cell.recentDogImgView.image = UIImage(data: lruImageData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width , height: 156)
    }
    
}

