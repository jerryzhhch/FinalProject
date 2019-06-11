/*
 
 Firebase ViewModel - view model used by SpellDetailViewController and ProfileViewController
 
 Technology:
 communitication pattern: notification
 
 */

import Foundation

class FireViewModel {
    
    // container for spells fetched from Firebase database
    var spells = [Spell]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.FireNotification, object: nil)
        }
    }
    
    // container for selected spell
    var currentSpell: Spell!
    
    func getFire() {
        fireService.get { [unowned self] spells in
            self.spells = spells
            print("Fire count: ", self.spells.count)
        }
    } // end func
    
    func isExisted(spell: Spell) -> Bool {
        for sp in spells {
            if sp.spell == spell.spell {
                return true
            }
        }
        return false
    } //end func
    
    
} // end class
