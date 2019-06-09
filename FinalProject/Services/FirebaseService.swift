/*
 
 Firebase service - helps getting data from Firebase database
 
 Technology:
 Firebase database
 design pattern: singleton pattern
 
 */

import Foundation
import FirebaseDatabase

let fireService = FirebaseService.shared

final class FirebaseService {
    
    static let shared = FirebaseService()
    private init() {}
    
    lazy var spellRef = Database.database().reference(withPath: "spell")
    
    // SAVE
    func save(spell: Spell) {
        spellRef.child(spell.spell).setValue(spell.toDictionary)
        print("Saved spell: ", spell.spell)
    }
    
    // LOAD
    func get(completion: @escaping SpellHandler) {
        var spells = [Spell]()
        
        spellRef.observeSingleEvent(of: .value) {
            snapshot in
            for snap in snapshot .children {
                let data: DataSnapshot = snap as! DataSnapshot
                guard let spell = Spell(snapshot: data) else {
                    continue
                }
                spells.append(spell)
            }
            completion(spells)
        }
    }
    
    // DELETE
    func remove(spell: Spell) {
        spellRef.child(spell.spell).removeValue()
        print("Removed spell: ", spell.spell)
    }
    
    
} // end class
