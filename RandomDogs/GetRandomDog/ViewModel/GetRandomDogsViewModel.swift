//
//  GetRandomDogsViewModel.swift
//  RandomDogs
//
//  Created by Farooque Azam on 30/06/21.
//

import Foundation

typealias onCompletion = (Bool, String?) -> Void

class GetRandomDogsViewModel {
    
    // MARK: - GetRandomDogsModel Model Instance.
    var dataSource : GetRandomDogsModel!
    
    
    func getRandomDogs(inUrl : String , completionBlock : @escaping onCompletion){
        APIManager.sharedInstance.getAPiData(requestURL: URL(string: inUrl)!, resultType: GetRandomDogsModel.self) { [weak self] (data, error) in
            if error == nil {
                self?.dataSource = data as? GetRandomDogsModel
                completionBlock(true , nil)
            } else {
                completionBlock(true , error)
            }
        }
    }
}
