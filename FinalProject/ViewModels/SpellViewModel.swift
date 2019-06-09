/*
 
 Spell ViewModel - view model used by SpellViewController
 
 Technology:
 communitication pattern: delegation
 
 */

import Foundation

protocol ViewModelDelegate: class {
    func updateView()
}

class SpellViewModel {
    
    weak var delegate: ViewModelDelegate?
    
    // container for all spells
    private(set) var spells = [Spell]() {
        didSet {
            groupedSpells = groupSpells(spells: spells)
        }
    }
    
    // container for all grouped spells
    private(set) var groupedSpells = [ String:[Spell] ]() {
        didSet {
            delegate?.updateView()
        }
    }
    
    // container for filtered spells
    var filteredSpells = [Spell]()
   
    // container for selected spell
    var currentSpell: Spell!
    
    // container for randome House
    var randomHouse: String!
    
    // get a random House
    func getAhouse() {
        apiService.getAHouse { [unowned self] (house) in
            self.randomHouse = house
            print("Random House: ", self.randomHouse)
        }
    }
    
    // get all Spells
    func getSpells() {
        apiService.getSpells { [unowned self] (data) in
            self.spells = data
            print("Spell count: ", self.spells.count)
        }
    
    }
    
    // helping func
    // group Spells by type
    func groupSpells(spells: [Spell]) -> [ String:[Spell] ] {
        let groupedSpells = Dictionary(grouping: spells, by: {$0.type})
        return groupedSpells
    }

    
} // end class
