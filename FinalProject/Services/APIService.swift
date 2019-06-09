/*
 
 API call service - helps getting data from API via URL strings
 
 Technology:
 URLSession
 JSON Decoder
 design pattern: singleton pattern
 
 */

import Foundation

let apiService = APIService.shared

typealias HouseHandler = ([House]) -> Void
typealias RandomHouseHandler = (String) -> Void
typealias SpellHandler = ([Spell]) -> Void
typealias CharacterHandler = ([Character]) -> Void

final class APIService {
    static let shared = APIService()
    private init() {}
    
    lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return URLSession(configuration: config)
    }()
    
    // return all houses
    func getHouses(completion: @escaping HouseHandler) {
        let urlString = APIQuery.getHouses().addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        guard let url = URL(string: urlString!) else {
            completion([])
            return
        }
       
        session.dataTask(with: url) { (data, _, _) in
            if let myData = data {
                do {
                    var houses = [House]()
                    let response = try JSONDecoder().decode([House].self, from: myData)
                    houses = response
                    completion(houses)
                } catch {
                    print("Cannot Serialize Data")
                    completion([])
                    return
                }
            }
        }.resume()
    } // end func
    
    // return a random House
    func getAHouse(completion: @escaping RandomHouseHandler) {
        let urlString = APIQuery.getAHouse()
        
        guard let url = URL(string: urlString) else {
            completion("")
            return
        }
        print("URL: ", url)
        session.dataTask(with: url) { (data, _, _) in
            if let myData = data {
                print("myData: ", myData)
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: myData, options: []) as? String else {
                        completion("")
                        return
                    }
                    completion(jsonObject)
                    
                } catch {
                    print("Cannot Serialize Data")
                    completion("")
                    return
                }
            }
        }.resume()
    } // end func
    
    // return all spells
    func getSpells(completion: @escaping SpellHandler) {
        let urlString = APIQuery.getSpells()
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }
        
        session.dataTask(with: url) { (data, _, _) in
            if let myData = data {
                do {
                    let response = try JSONDecoder().decode([Spell].self, from: myData)
                    completion(response)
                } catch {
                    print("Cannot Serialize Data")
                    completion([])
                    return
                }
            }
        }.resume()
    } // end func
    
    // return all characters
    func getCharacters(completion: @escaping CharacterHandler) {
        let urlString = APIQuery.getCharacters()
        
        guard let url = URL(string: urlString) else {
            completion([])
            return
        }

        session.dataTask(with: url) { (data, _, _) in
            if let myData = data {
                do {
                    let response = try JSONDecoder().decode([Character].self, from: myData)
                    completion(response)
                } catch {
                    print("Cannot Serialize Data")
                    completion([])
                    return
                }
            }
            }.resume()
    }
    
} // end class
