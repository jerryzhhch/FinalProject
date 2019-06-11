/*
 
 Character View Model - view model used by CharactersViewController and ProfileViewController
 
 Technology:
 communitication pattern: notification
 
 */

import Foundation

class CharacterViewModel {
    
    // container for all Characters
    private(set) var characters = [Character]() {
        didSet {
            groupedCharByIndex = groupCharacterByIndex(chars: characters)
            groupedCharByHouse = groupCharacterByHouse(chars: characters)
        }
    }
    
    // container for grouped Characters by index letter
    private(set) var groupedCharByIndex = [ String:[Character] ]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.CharacterNotificationOne, object: nil)
        }
    }

    // container for grouped Characters by House
    private(set) var groupedCharByHouse = [ String:[Character] ]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.CharacterNotificationTwo, object: nil)
        }
    }

    // container for selected character
    var currentChar: Character!
    
    // get all Characters
    func getCharacters() {
        apiService.getCharacters { [unowned self] (data) in
            self.characters = data
            self.characters .sort(by: {$0.name < $1.name})
            print("Character count: ", self.characters.count)
        }
    } //end func
    
    // group Characters by index letter
    func groupCharacterByIndex(chars: [Character]) -> [ String:[Character] ] {
        let groupedChars = Dictionary(grouping: chars, by: {$0.name.prefix(1).uppercased()})
        return groupedChars
    }
    
    // group Characters by House
    func groupCharacterByHouse(chars: [Character]) -> [ String:[Character] ] {
        let groupedChars = Dictionary(grouping: chars, by: {$0.house})
        return groupedChars
    }
    
    // return grouped characters
//    func getClassmates() -> [Character] {
//        var classmates = [Character]()
//        let houseKey = UserSettings.getHouse()
//        print("Key: ", houseKey)
//        if houseKey.isEmpty {
//            classmates = []
//        } else {
//            classmates = groupedCharByHouse[houseKey]
//        }
//        print("Classmate count: ", classmates.count)
//        return classmates
//    }
    
} // end class
