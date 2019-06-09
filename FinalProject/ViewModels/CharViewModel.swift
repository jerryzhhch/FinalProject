/*
 
 Character View Model - view model used by CharactersViewController and ***
 
 Technology:
 communitication pattern: notification
 
 */

import Foundation

class CharacterViewModel {
    
    // container for all Characters
    private(set) var characters = [Character]() {
        didSet {
            groupedCharacters = groupCharacter(chars: characters)
        }
    }
    
    // container for grouped Characters
    private(set) var groupedCharacters = [ String:[Character] ]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.CharacterNotification, object: nil)
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
    
    // group Spells by type
    func groupCharacter(chars: [Character]) -> [ String:[Character] ] {
        let groupedChars = Dictionary(grouping: chars, by: {$0.name.prefix(1).uppercased()})
        return groupedChars
    }
    
} // end class
