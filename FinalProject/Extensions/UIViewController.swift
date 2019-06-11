/*
 
 Extension for UIViewController - shows an alert window
 
 Technology:
 UIAlertController
 
 */

import UIKit

extension UIViewController {
    
    func showAlert(title: String?, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }
    
    func getAge() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let currentYear = Int(calendar.component(.year, from: date))
        print("current year: ", currentYear)
        let userDate = UserSettings.getBirth()
        let dobYear = Int(calendar.component(.year, from: userDate))
        print("birth year: ", dobYear)
        
        return currentYear - dobYear
    }
    
    func goToDetail(nav: UINavigationController, object: Any, type: String) {
        let storyboard = UIStoryboard(name: "Detail", bundle: .main)
        switch type {
        // go to Character detail page
        case "character" :
            let detailVC = storyboard.instantiateViewController(withIdentifier: "CharDetailViewController") as! CharDetailViewController
            detailVC.character = object as! Character
            navigationController?.pushViewController(detailVC, animated: true)
        // go to Spell detail page
        case "spell" :
            let detailVC = storyboard.instantiateViewController(withIdentifier: "SpellDetailViewController") as! SpellDetailViewController
            detailVC.spell = object as! Spell
            navigationController?.pushViewController(detailVC, animated: true)
        default:
            break
        }
    }
    
    func test() {
        print("----- test -----")
        print("Name: ", UserSettings.getName())
        print("DOB: ", UserSettings.getBirth())
        print("New user: ", UserSettings.getRegStatus())
        print("House: ", UserSettings.getHouse())
        print("Spell limit: ", UserSettings.getLimit())
        print("----------------")
    }
}
