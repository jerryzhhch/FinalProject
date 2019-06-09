/*
 
 Glogal Constants
 
 Technology:
 struct
 enum with raw values
 
 */

import UIKit

struct Constants {
    
    enum APIMethods: String {
        case random = "sortingHat"
        case houses = "houses"
        case spells = "spells"
        case characters = "characters"
    }
    
    enum houseWords: String {
        case Gryffindor = "By Gryffindor, the bravest were Prized far beyond the rest"
        case Ravenclaw = "For Ravenclaw, the cleverest Would always be the best"
        case Slytherin = "Power-hungry Slytherin Loved those of great ambition"
        case Hufflepuff = "For Hufflepuff, hard workers were Most worthy of admission"
    }
    
    enum defaultImage: String {
        case DefaultProfile = "DefaultProfile"
        case DefaultCharacter = "DefaultCharacter"
        case MinistryOfMagic = "MinistryOfMagic"
        case OrderOfThePhoenix = "OrderOfThePhoenix"
        case DumbledoresArmy = "DumbledoresArmy"
        case DeathEater = "DeathEater"
    }
} // end

