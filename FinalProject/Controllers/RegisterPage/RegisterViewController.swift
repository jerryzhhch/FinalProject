/*
 
 Register View Controller - manages Register view
 
 Technology:
 UIDatePicker - sets cell, configure cell sizes
 UserDefaults - save user non-sensitive information
 
 */

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    @IBOutlet weak var okButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func okButtonTapped(_ sender: UIButton) {
        // save name and date of birth
        guard let name = nameField.text else {
            return
        }
        if name.isEmpty {
            showAlert(title: "Empty Name", message: "Please enter your name")
            return
        }
        
        UserSettings.saveName(name: name)
        UserSettings.saveBirth(birth: dobPicker.date)
        
        // save spell count limit
        let age = getAge()
        let limit = calculateLimit(age: age)
        UserSettings.saveLimit(limit: limit)
        
        // save registration status
//        UserSettings.saveRegStatus(first: true)
        
    }
    
    // helping func
    func setupView() {
        
    }

    // get spell limit based on user's age
    func calculateLimit(age: Int) -> Int {
        switch age {
        case _ where age > 0 && age <= 7:
            return 0
        case _ where age > 7 && age <= 13:
            return 2
        case _ where age > 13 && age <= 18:
            return 5
        case _ where age > 18 && age <= 25:
            return 7
        case _ where age > 25 && age <= 50:
            return 10
        case _ where age > 50:
            return 15
        default:
            return 0
        }
    }
    
} // end class
