/*
 
 API querries - API URL strings
 
 Technology:
 struct
 
 */

import Foundation


struct APIQuery {
    static let base = "https://www.potterapi.com/v1/"
    static let key = "?key=$2a$10$idZjM/FDq8YHQyMtJNXH1O0yGtByyfv3hRm5m8uqlx7GapddU7i5W"
    
    static func getHouses() -> String {
        return base + Constants.APIMethods.houses.rawValue + key
    }
    
    static func getAHouse() -> String {
        return base + "sortingHat"
    }
    
    static func getSpells() -> String {
        return base + Constants.APIMethods.spells.rawValue + key
    }
    
    static func getCharacters() -> String {
        return base + Constants.APIMethods.characters.rawValue + key
    }
    
} // end
