/*
 
 Firebase ViewModel - view model used by SpellDetailViewController and ***
 
 Technology:
 communitication pattern: notification
 
 */

import Foundation

class FireViewModel {
    
    var spells = [Spell]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.FireNotification, object: nil)
        }
    }
    
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
