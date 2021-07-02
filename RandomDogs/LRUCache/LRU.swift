

import UIKit
import Foundation

protocol ImageStorge{
    func setData(_ value: Any, key: String)
    func getData(key: String) -> [UIImage]?
    func removeDogs()
}

class LRUHandler  {
    
    var lruImageData : [UIImage] = []
    var max :  Int?
    
    init (max : Int){
        self.max = max
        
    }
    
    func add(data : UIImage){
        lruImageData = SettingsArchiver.getData(key: PrefKey.cacheList) ?? []
        lruImageData += [data]
        if lruImageData.count > max ?? 0 {
            lruImageData.removeFirst()
        }
        SettingsArchiver.setData(lruImageData, key: PrefKey.cacheList)
    }
}

final class SettingsArchiver   {
    
    static func setData(_ value: Any, key: String) {
        let ud = UserDefaults.standard
        let archivedPool = try? NSKeyedArchiver.archivedData(withRootObject: value, requiringSecureCoding: true)
        ud.set(archivedPool, forKey: key)
    }
    
    static func getData(key: String) -> [UIImage]? {
        let ud = UserDefaults.standard
        if let val = ud.value(forKey: key) as? Data,
           let obj = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(val) as? [UIImage] {
            return obj
        }
        return nil
    }
    
    static func removeDogs(){
        let ud = UserDefaults.standard
        ud.removeObject(forKey: PrefKey.cacheList)
        ud.synchronize()
    }
}
