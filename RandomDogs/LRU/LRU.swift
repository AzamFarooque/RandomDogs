

import UIKit
import Foundation


class LRU {
    var lruImageData : [Data] = []
    let max = 20
    
    
    func add(data : Data){
        if lruImageData.count > 20{
            remove()
        }else{
            lruImageData.append(data)
        }
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "SavedImageData")
        defaults.synchronize()
        defaults.set(lruImageData, forKey: "SavedImageData")
    }
    
    
    
    func remove(){
        lruImageData.removeLast()
    }
}
