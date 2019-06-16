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
        case "character":
            let detailVC = storyboard.instantiateViewController(withIdentifier: "CharDetailViewController") as! CharDetailViewController
            guard let ob = object as? Character else {
                return
            }
            detailVC.character = ob
            navigationController?.pushViewController(detailVC, animated: true)
        // go to Spell detail page
        case "spell":
            let detailVC = storyboard.instantiateViewController(withIdentifier: "SpellDetailViewController") as! SpellDetailViewController
            guard let ob = object as? Spell else {
                return
            }
            detailVC.spell = ob
            navigationController?.pushViewController(detailVC, animated: true)
        default:
            break
        }
    }
    
    func goToProfile() {
        let storyboard = UIStoryboard(name: "Detail", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        present(vc, animated: true, completion: nil)
    }
    
    // change part of label to BOLD
//    func makeBold(text: String, boldString: String) -> NSAttributedString {
//        print("-------- im here ----------")
//        let font = UIFont.systemFontSize
//        print("Font: ", font)
//        let attributedString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font: font])
//        print("Attributed String: ", attributedString)
//        let boldFontAttribute = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: font)]
//        print("Bolde Font Attribute: ", boldFontAttribute)
//        let range = (text as NSString).range(of: boldString)
//        print("Range: ", range)
//        attributedString.addAttributes(boldFontAttribute, range: range)
//        print("Attributed String: ", attributedString)
//        return attributedString
//    }
    
    func test() {
        print("----- test -----")
        print("Name: ", UserSettings.getName())
        print("DOB: ", UserSettings.getBirth())
        print("New user: ", UserSettings.getRegStatus())
        print("House: ", UserSettings.getHouse())
        print("Spell limit: ", UserSettings.getLimit())
        print("DA :", UserSettings.getDumbledoresArmy())
        print("Ministry :", UserSettings.getMinistryOfMagic())
        print("Orger :", UserSettings.getOrderOfThePhoenix())
        print("Death :", UserSettings.getDeathEater())
        print("----------------")
    }
}
