/*
 
 Character Class
 
 Technology:
 JSON decodable class
 initializer for missing Keys
 
 */

import Foundation

class Character: Codable {
    let name: String
    let role: String
    let house: String
    let school: String
    let ministryOfMagic: Bool
    let orderOfThePhoenix: Bool
    let dumbledoresArmy: Bool
    let deathEater: Bool
    let bloodStatus: String
    let species: String
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "unknown"
        self.role = try container.decodeIfPresent(String.self, forKey: .role) ?? "unknown"
        self.house = try container.decodeIfPresent(String.self, forKey: .house) ?? "unknown"
        self.school = try container.decodeIfPresent(String.self, forKey: .school) ?? "unknown"
        self.ministryOfMagic = try container.decodeIfPresent(Bool.self, forKey: .ministryOfMagic) ?? false
        self.orderOfThePhoenix = try container.decodeIfPresent(Bool.self, forKey: .orderOfThePhoenix) ?? false
        self.dumbledoresArmy = try container.decodeIfPresent(Bool.self, forKey: .dumbledoresArmy) ?? false
        self.deathEater = try container.decodeIfPresent(Bool.self, forKey: .deathEater) ?? false
        self.bloodStatus = try container.decodeIfPresent(String.self, forKey: .bloodStatus) ?? "unknown"
        self.species = try container.decodeIfPresent(String.self, forKey: .species) ?? "unknown"
    }
}
