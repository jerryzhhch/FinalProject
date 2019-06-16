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

