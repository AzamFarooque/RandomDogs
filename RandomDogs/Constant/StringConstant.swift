//
//  ConstantFile.swift
//  RandomDogs
//
//  Created by Farooque Azam on 01/07/21.
//

import UIKit
import Foundation



struct StringConstants {
    static let GenerateDogsText = "Generate Dogs!"
    static let RecentlyGeneratedDogsText = "My Recently Generated Dogs!"
    
}

struct PrefKey {
    static let cacheList = "cacheList"
}


struct API {
    static let GetRandomDogImageURL = "https://dog.ceo/api/breeds/image/random"
}
