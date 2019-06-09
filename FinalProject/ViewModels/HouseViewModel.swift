/*
 
 House ViewModel - view model used by HouseViewController and HouseDetailViewController
 
 Technology:
 communitication pattern: notification
 
 */

import Foundation

class HouseViewModel {
   
    // container for all Houses
    private(set) var houses = [House]() {
        didSet {
            NotificationCenter.default.post(name: Notification.Name.HouseNotification, object: nil)
        }
    }
    
    // container for selected House
    var currentHouse: House!
    
    // get all Houses
    func getHouses() {
        apiService.getHouses { [unowned self] (data) in
            self.houses = data
            print("House count: ", self.houses.count)
        }
    } //end func
    
} // end class
