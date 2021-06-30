//
//  GetRandomDogsVC.swift
//  RandomDogs
//
//  Created by Farooque Azam on 30/06/21.
//

import UIKit

class GetRandomDogsVC: UIViewController {
    
    @IBOutlet weak var randomDogsImgView: LazyImageView!
    
    // MARK: - GetRandomDogsViewModel Instance Intialise.
    let viewModel : GetRandomDogsViewModel = GetRandomDogsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapToGenerateDogs(_ sender: UIButton) {
        
        self.fetchRandomDogs()
    }
    // MARK: - Fetching random dogs
    
    func fetchRandomDogs(){
        viewModel.getRandomDogs(inUrl : "https://dog.ceo/api/breeds/image/random") { [weak self] (success, error) in
            if success {
                DispatchQueue.main.async{
                    self?.randomDogsImgView.loadImage(fromURL: URL(string : self?.viewModel.dataSource.message ?? "")!, placeHolderImage: "")
                }
            } else if error != nil {
                print(error!)
            }
        }
    }
}


