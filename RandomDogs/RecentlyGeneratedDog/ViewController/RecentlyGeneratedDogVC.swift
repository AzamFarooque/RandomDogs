//
//  RecentlyGeneratedDogVC.swift
//  RandomDogs
//
//  Created by Farooque Azam on 01/07/21.
//

import UIKit

class RecentlyGeneratedDogVC: UIViewController {
    // MARK: - CollectionView Instance Intialise.
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - LRUHandler Instance Intialise.
    let cache = LRUHandler(max: 20, _imageStorge: SettingsArchiver())
    // MARK: - LRU List Instance Intialise.
    var lruImageData : [UIImage] = []
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 10
            layout.scrollDirection = .horizontal
        }
        
        if let lru =  cache.getDogsList(){
            self.lruImageData = lru
            self.lruImageData = self.lruImageData.reversed()
            registerCell()
            collectionReload()
            
        }
    }
    
    // MARK: - CollectionView Reload
    
    func collectionReload(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    // MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title  = StringConstants.RecentlyGeneratedDogsText
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Register Collection Cell
    
    private func registerCell() {
        let nib = UINib(nibName: RecentlyGeneratedDogsCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: RecentlyGeneratedDogsCollectionViewCell.identifier)
        
    }
    
    // MARK: - Clear Dog List
    
    @IBAction func didTapToClearDogs(_ sender: Any) {
        cache.removeDogsList()
        self.lruImageData = cache.getDogsList() ?? []
        collectionView.reloadData()
        
    }
}

// MARK: - CollectionView Delefate And DataSources

extension RecentlyGeneratedDogVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lruImageData.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecentlyGeneratedDogsCollectionViewCell.identifier, for: indexPath) as! RecentlyGeneratedDogsCollectionViewCell
        cell.recentDogImgView.image = lruImageData[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width - 32 , height: 300)
    }
}

