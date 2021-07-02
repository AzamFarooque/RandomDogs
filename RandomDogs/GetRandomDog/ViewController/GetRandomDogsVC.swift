//
//  GetRandomDogsVC.swift
//  RandomDogs
//
//  Created by Farooque Azam on 30/06/21.
//

import UIKit

class GetRandomDogsVC: UIViewController {
    // MARK: - ActivityIndicator Instance Intialise.
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    // MARK: - RandomImageView Instance Intialise.
    @IBOutlet weak var randomDogsImgView: LazyImageView!
    // MARK: - GetRandomDogsViewModel Instance Intialise.
    let viewModel : GetRandomDogsViewModel = GetRandomDogsViewModel()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }
    
    // MARK: - ViewWillAppear
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title  = StringConstants.GenerateDogsText
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK: - Action To Generate Dog Image
    
    @IBAction func didTapToGenerateDogs(_ sender: UIButton) {
        self.fetchRandomDogs()
    }
}

extension GetRandomDogsVC {
    
    // MARK: - Fetching Random Dogs
    
    func fetchRandomDogs(){
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewModel.getRandomDogs(inUrl : API.GetRandomDogImageURL) { [weak self] (success, error) in
            if success {
                DispatchQueue.main.async{
                    self?.activityIndicator.stopAnimating()
                    self?.activityIndicator.isHidden = true
                    self?.randomDogsImgView.loadImage(fromURL: URL(string : self?.viewModel.dataSource.message ?? "")!)
                }
            } else if error != nil {
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
                print(error!)
            }
        }
    }
}


