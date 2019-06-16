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
    
    // SAVE
    func save(spell: Spell) {
        let rootRef = Database.database().reference(withPath: makeID())
        let spellRef = rootRef.child("spell")
        spellRef.child(spell.spell).setValue(spell.toDictionary)
        print("Saved spell: ", spell.spell)
    }
    
    // LOAD
    func get(completion: @escaping SpellHandler) {
        let rootRef = Database.database().reference(withPath: makeID())
        let spellRef = rootRef.child("spell")
        
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
        let rootRef = Database.database().reference(withPath: makeID())
        let spellRef = rootRef.child("spell")
        spellRef.child(spell.spell).removeValue()
        print("Removed spell: ", spell.spell)
    }
    
    // set Firebase database ID
    func makeID() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: UserSettings.getBirth())
        let id = UserSettings.getName() + myString
        return id
    }
    
    
} // end class
