//
//  ViewController.swift
//  RandomDogs
//
//  Created by Farooque Azam on 29/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var recentlyGeneratedDogButton: UIButton!
    @IBOutlet weak var generateDogButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func didTapToMoveGenerateDogs(_ sender: UIButton) {
        let storyboard = UIStoryboard(storyboard: .GetRandomDog)
        let getRandomDogsVC : GetRandomDogsVC = storyboard.instantiateViewController()
        
        self.navigationController?.pushViewController(getRandomDogsVC, animated: true)
        
    }
    
    @IBAction func didTapToSeeRecentlyGeneratedDogs(_ sender: UIButton) {
        let storyboard = UIStoryboard(storyboard: .RecentlyGeneratedDog)
        let getRandomDogsVC : RecentlyGeneratedDogVC = storyboard.instantiateViewController()
        self.navigationController?.pushViewController(getRandomDogsVC, animated: true)
    }
}

