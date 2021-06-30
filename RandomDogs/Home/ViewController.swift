//
//  ViewController.swift
//  RandomDogs
//
//  Created by Farooque Azam on 29/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapToMoveGenerateDogs(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(storyboard: .GetRandomDog)
        let getRandomDogsVC : GetRandomDogsVC = storyboard.instantiateViewController()
        self.navigationController?.pushViewController(getRandomDogsVC, animated: true)
        
    }
   
}

