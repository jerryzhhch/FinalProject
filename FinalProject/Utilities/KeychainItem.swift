/*
 
 Keychain utility - helps saving and securing uers password
 
 Technology:
 Keychain
 
 */

import Foundation
import Security

struct Keychain {
    
    let service = Constants.keychain.service.rawValue
    private(set) var account = String()
    
    // SAVE
    func saveToKeychain(data: String) {
        var keychainItem = createKeychainItem()
        
        // encode the data we want to save
        let encodedData = data.data(using: .utf8)
        
        // add encoded data to keychain item
        keychainItem[kSecValueData as String] = encodedData as AnyObject?
        
        // add keychain item to keychain
        SecItemAdd(keychainItem as CFDictionary, nil)
        
        print("Saved data to Keychain")
    }
    
    // LOAD
    func loadFromKeychain() {
        var keychainItem = createKeychainItem()
        
        // set return attributes, true == unencyrpted
        keychainItem[kSecReturnAttributes as String] = kCFBooleanTrue
        
        // set return type for data, true == return with Data.type
        keychainItem[kSecReturnData as String] = kCFBooleanTrue
        
        // container, to hold our returned KeyChain Item
        var returnedItem: AnyObject?
        
        // copy method, check if the item exists
        SecItemCopyMatching(keychainItem as CFDictionary, &returnedItem)
        
        // container, retrieved data
        var data: String?
        
        if let existingItem = returnedItem as? [String:AnyObject],
            let encodedData = existingItem[kSecValueData as String] as? Data {
            data = String(data: encodedData, encoding: .utf8)
        }
        
        if data != nil && data == account {
            print(true)
        } else {
            print(false)
        }
        
    }
    
    // DELETE
    func deleteKeychainItem() {
        let keychainItem = createKeychainItem()
        SecItemDelete(keychainItem as CFDictionary)
    }
    
    // UPDATE
    func updateKeychainItem(data: String) {
        var keychainItem = createKeychainItem()
        
        // encode the data we want to save
        let encodedData = data.data(using: .utf8)
        
        // add encoded data to keychain item
        keychainItem[kSecValueData as String] = encodedData as AnyObject?
        
        // update
        SecItemUpdate(keychainItem as CFDictionary, keychainItem as CFDictionary)
    }
    
    // is Valid?
    var isValid: Bool {
        var item = createKeychainItem()
        
        //set return attributes, true == unencyrpted
        item[kSecReturnAttributes as String] = kCFBooleanTrue
        
        //set return type for data, true == return with Data.type
        item[kSecReturnData as String] = kCFBooleanTrue
        
        //container, to hold our returned KeyChain Item
        var result: AnyObject?
        
        //copy method, check if the item exists
        SecItemCopyMatching(item as CFDictionary, &result)
        
        //container, retrieved password
        var retrieved: String?
        
        if let existingItem = result as? [String:AnyObject],
            let encodedPassword = existingItem[kSecValueData as String] as? Data {
            
            retrieved = String(data: encodedPassword, encoding: .utf8)
        }
        
        if retrieved != nil && retrieved == account {
            print("Validated User From Keychain")
            return true
        }
        return false
    }
    
    
    // create keychain item first
    private func createKeychainItem() -> [String:AnyObject] {
        var item = [String:AnyObject]()
        
        // password
        item[kSecClass as String] = kSecClassGenericPassword
        // account
        item[kSecAttrAccount as String] = account as AnyObject?
        // service
        item[kSecAttrService as String] = service as AnyObject?
        
        return item
    }
}
