/*
 
 FileManager utility - helps saving uers profile image to local device
 
 Technology:
 FileManager
 
 */

import UIKit

struct Utility {
    static private let fileManager = FileManager.default
    
    // SAVE
    static func save(data: Data) {
        let hash = String(data.hashValue)
        
        guard let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(hash) else {
            return
        }
        do {
            try data.write(to: url)
            print("Successfully wrote data to disk")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // LOAD
    static func load(hash: String) -> URL? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomain = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomain, true)
        
        if let dirPath = paths.first {
            let url = URL(fileURLWithPath: dirPath).appendingPathComponent(hash)
            return url
        }
        return nil
    }
    
}
