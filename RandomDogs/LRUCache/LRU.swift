

import UIKit
import Foundation

protocol ImageStorge{
    func setData(_ value: Any, key: String)
    func getData(key: String) -> [UIImage]?
    func removeData()
}

class LRUHandler  {
    
    private let _imageStorge : ImageStorge
    var lruImageData : [UIImage] = []
    var max :  Int?
    
    init (max : Int , _imageStorge : ImageStorge){
        self.max = max
        self._imageStorge = _imageStorge
    }
    
    // MARK: Add Dog Image In List
    
    func addDogs(image : UIImage){
        lruImageData = _imageStorge.getData(key: PrefKey.cacheList) ?? []
        lruImageData += [image]
        if lruImageData.count > max ?? 0 {
            lruImageData.removeFirst()
        }
        _imageStorge.setData(lruImageData, key: PrefKey.cacheList)
    }
    
    // MARK: Get Dog List
    
    func getDogsList() -> [UIImage]?{
        return  _imageStorge.getData(key: PrefKey.cacheList)
    }
    
    // MARK: Remove Dog List
    
    func removeDogsList() {
        _imageStorge.removeData()
    }
}

class SettingsArchiver : ImageStorge  {
    
    // MARK: - Storing Data
    
    func setData(_ value: Any, key: String) {
        let ud = UserDefaults.standard
        let archivedPool = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
        ud.set(archivedPool, forKey: key)
    }
    
    // MARK: - Retrive Data
    
    func getData(key: String) -> [UIImage]? {
        let ud = UserDefaults.standard
        if let val = ud.value(forKey: key) as? Data,
           let obj = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(val) as? [UIImage] {
            return obj
        }
        return nil
    }
    
    // MARK: - Remove Data
    
    func removeData(){
        let ud = UserDefaults.standard
        ud.removeObject(forKey: PrefKey.cacheList)
        ud.synchronize()
    }
}
