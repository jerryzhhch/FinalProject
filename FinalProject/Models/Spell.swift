/*
 
 Spell Class
 
 Technology:
 JSON decodable class
 optional initializer with Firebase DataSnapShot
 
 */

import Foundation
import FirebaseDatabase

class Spell: Decodable {
    let spell: String
    let type: String
    let effect: String
    
    init?(snapshot: DataSnapshot) {
        guard let value = snapshot.value as? [String:Any] else {
            return nil
        }
        self.spell = value["spell"] as! String
        self.type = value["type"] as! String
        self.effect = value["effect"] as! String
    }
}
