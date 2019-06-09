/*
 
 Extension for Spell Class - groups all class properties as a dictionary
 
 Technology:
 
 */

import Foundation

extension Spell {
    var toDictionary: [String:String] {
        return ["spell": self.spell, "type": self.type, "effect": self.effect]
    }
}
