//
//  ViewController.swift
//  RandomDogs
//
//  Created by Farooque Azam on 29/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - User Tap To Generate Dog Image From Server
    
    @IBAction func didTapToMoveGenerateDogs(_ sender: UIButton) {
        let storyboard = UIStoryboard(storyboard: .GetRandomDog)
        let getRandomDogsVC : GetRandomDogsVC = storyboard.instantiateViewController()
        
        self.navigationController?.pushViewController(getRandomDogsVC, animated: true)
        
    }
    
    
    // MARK: - User Tap To See Least Recently Used Dog Image
    
    @IBAction func didTapToSeeRecentlyGeneratedDogs(_ sender: UIButton) {
        let storyboard = UIStoryboard(storyboard: .RecentlyGeneratedDog)
        let getRandomDogsVC : RecentlyGeneratedDogVC = storyboard.instantiateViewController()
        self.navigationController?.pushViewController(getRandomDogsVC, animated: true)
    }
}

