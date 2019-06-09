/*
 
 House Class
 
 Technology:
 JSON decodable class
 
*/

import Foundation

class House: Decodable {
    let name: String
    let mascot: String
    let headOfHouse: String
    let houseGhost: String
    let founder: String
//    let members: [String]
    let values: [String]
    let colors: [String]

}
