/*
 
 UserSettings utility - saves user's information
 
 Technology:
 UserSettings
 enum with raw values
 
 */

import Foundation

struct UserSettings {
    private enum keys: String {
        case house = "house"
        case name = "name"
        case dateOfBirth = "dob"
        case limit = "limit"
        case firstRegistration = "first"
        case imageHash = "hash"
        case hasPassword = "password"
    }
    
    // Setters
    static func saveHouse(house: String) {
        UserDefaults.standard.set(house, forKey: UserSettings.keys.house.rawValue)
    }
    
    static func saveName(name: String) {
        UserDefaults.standard.set(name, forKey: UserSettings.keys.name.rawValue)
    }
    
    static func saveBirth(birth: Date) {
        UserDefaults.standard.set(birth, forKey: UserSettings.keys.dateOfBirth.rawValue)
    }
    
    static func saveLimit(limit: Int) {
        UserDefaults.standard.set(limit, forKey: UserSettings.keys.limit.rawValue)
    }
    
    static func saveRegStatus(first: Bool) {
        UserDefaults.standard.set(first, forKey: UserSettings.keys.firstRegistration.rawValue)
    }
    
    static func saveImageHash(hash: String) {
        UserDefaults.standard.set(hash, forKey: UserSettings.keys.imageHash.rawValue)
    }
    
    static func saveHasPassword(hasPassword: Bool) {
        UserDefaults.standard.set(hasPassword, forKey: UserSettings.keys.hasPassword.rawValue)
    }
    
    // Getters
    static func getHouse() -> String {
        return UserDefaults.standard.value(forKey: UserSettings.keys.house.rawValue) as? String ?? ""
    }
    
    static func getName() -> String {
        return UserDefaults.standard.value(forKey: UserSettings.keys.name.rawValue) as? String ?? ""
    }
    
    static func getBirth() -> Date {
        var dateComponent = DateComponents()
        dateComponent.year = 10
        dateComponent.month = 1
        dateComponent.day = 1
        let date = NSCalendar.current.date(from: dateComponent)!
        return UserDefaults.standard.value(forKey: UserSettings.keys.dateOfBirth.rawValue) as? Date ?? date
    }
    
    static func getLimit() -> Int {
        return UserDefaults.standard.value(forKey: UserSettings.keys.limit.rawValue) as? Int ?? 3
    }
    
    static func getRegStatus() -> Bool {
        return UserDefaults.standard.value(forKey: UserSettings.keys.firstRegistration.rawValue) as? Bool ?? false
    }
    
    static func getImageHash() -> String {
        return UserDefaults.standard.value(forKey: UserSettings.keys.imageHash.rawValue) as? String ?? ""
    }
    
    static func getHasPassword() -> Bool {
        return UserDefaults.standard.value(forKey: UserSettings.keys.hasPassword.rawValue) as? Bool ?? false
    }
    
}
