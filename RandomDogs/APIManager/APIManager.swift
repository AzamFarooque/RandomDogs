//
//  APIManager.swift
//  RandomDogs
//
//  Created by Farooque Azam on 30/06/21.
//

import Foundation
import UIKit

typealias ServiceResponse = (_ T : Decodable , _ error : String?) -> Void

class APIManager {
   
    static let sharedInstance = APIManager()
    private init(){}
    
    func getAPiData<T : Decodable>(requestURL : URL , resultType : T.Type  , onCompletion: @escaping ServiceResponse) {
        URLSession.shared.dataTask(with: requestURL) { (responseData, httpUrlResponse, error) in
            if(error == nil && responseData != nil && responseData?.count != 0){
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: responseData!)
                    onCompletion(result , nil)
                }
                catch let error{
                    debugPrint("error occured while decoding = \(error.localizedDescription)")
                }
            }
        }
        .resume()
    }
}
