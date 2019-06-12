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
    
    enum houseID: String {
        case Gryffindor = "5a05e2b252f721a3cf2ea33f"
        case Ravenclaw = "5a05da69d45bd0a11bd5e06f"
        case Hufflepuff = "5a05dc58d45bd0a11bd5e070"
        case Slytherin = "5a05dc8cd45bd0a11bd5e071"
    }
    
    enum houseName: String {
        case Gryffindor
        case Ravenclaw
        case Hufflepuff
        case Slytherin
    }
    
    enum houseWords: String {
        case Gryffindor = "By Gryffindor, the bravest were Prized far beyond the rest"
        case Ravenclaw = "For Ravenclaw, the cleverest Would always be the best"
        case Slytherin = "Power-hungry Slytherin Loved those of great ambition"
        case Hufflepuff = "For Hufflepuff, hard workers were Most worthy of admission"
    }
    
    enum song: String {
        case GryffindorSong = "Bold Gryffindor, from wild moor ~ ♫ ♪"
        case RavenclawSong = "Fair Ravenclaw, from glen ~ ♬ ♬ ♫"
        case SlytherinSong = "Sweet Hufflepuff, from valley broad ~ ♪ ♫ ♫"
        case HufflepuffSong = "Shrewd Slytherin, from fen ~ ♪ ♪ "
    }
    
    enum defaultImage: String {
        case GryffindorFlag = "GryffindorFlag"
        case HufflepuffFlag = "HufflepuffFlag"
        case RavenclawFlag = "RavenclawFlag"
        case SlytherinFlag = "SlytherinFlag"
        
        case GryffindorMascot = "GryffindorMascot"
        case HufflepuffMascot = "HufflepuffMascot"
        case RavenclawMascot = "RavenclawMascot"
        case SlytherinMascot = "SlytherinMascot"
        
        case DefaultProfile = "DefaultProfile"
        case DefaultCharacter = "DefaultCharacter"
        
        case MinistryOfMagic = "MinistryOfMagic"
        case OrderOfThePhoenix = "OrderOfThePhoenix"
        case DumbledoresArmy = "DumbledoresArmy"
        case DeathEater = "DeathEater"
    }
    
    enum keychain: String {
        case service = "Hogwarts"
    }
} // end

