/*
 
 Authentication View Controller - manages authentication page
 
 Technology:
 Keychain - save user password
 Biometric authentication
 
 */

import UIKit
import LocalAuthentication


class AuthViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var asteriksLabel: UILabel!
    @IBOutlet weak var keypadView: UICollectionView!
    
    let keys = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "done", "0", "backspace"]
    fileprivate var asteriks = String()
    fileprivate var selectedNumbers = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // fingerprint button
    @IBAction func fingerprintButtonTapped(_ sender: UIButton) {
        bioAuth { [unowned self] (err) in
            if let error = err {
                self.showAlert(title: "Error", message: error)
            }
        }
    }
    
    // helping func
    func setupView() {
        
        if UserSettings.getHasPassword() {
            titleLabel.text = "Enter Password"
        } else {
            titleLabel.text = "Set Password"
        }
        
        asteriksLabel.text = ""
    }

    // biometric authentication
    func bioAuth(completion: @escaping (String?)->Void) {
        let context = LAContext()
        context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        
        let reason = "Use Biometrics for Authentication"
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [unowned self] (success, error) in
            if success {
                self.goToProfile()
                completion(nil)
            } else {
                completion("Could Not Authenticate")
            }
        }
    }
    
} // end class


// Extension: UICollectionView
extension AuthViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // number of item in a section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys.count
    }
    
    // size for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = CGFloat()
        size = view.frame.size.width / 4.8
        return .init(width: size, height: size)
    }
    
    // inset for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 60, bottom: 0, right: 60)
    }
    
    // minimum inter item spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // set collection cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AuthCollectionCell.identifier, for: indexPath) as! AuthCollectionCell
        let key = keys[indexPath.row]
        if key == "done" {
            cell.tag = 1
        }
        if key == "backspace" {
            cell.tag = 2
        }
        cell.config(text: key)
        return cell
    }
    
    // select a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! AuthCollectionCell
        switch cell.tag {
        case 1:
            // done
            let item = Keychain(account: selectedNumbers)
            
            switch UserSettings.getHasPassword() {
            case true:
                // if has set password before
                if item.isValid {
                    self.goToProfile()
                } else {
                    showAlert(title: "Wrong Code", message: "You have entered the incorrect code")
                    selectedNumbers = ""
                    asteriks = ""
                    asteriksLabel.text = asteriks
                }
            case false:
                // not set password before
                guard selectedNumbers.count == 4 else {
                    showAlert(title: "Invalid Code", message: "Not enough digits")
                    return
                }
                item.saveToKeychain(data: selectedNumbers)
                UserSettings.saveHasPassword(hasPassword: true)
                self.goToProfile()
            }
        case 2:
            // backspace
            guard !selectedNumbers.isEmpty else {
                return
            }
            selectedNumbers.removeLast()
            asteriks.removeLast()
            asteriksLabel.text = asteriks
        default:
            // number
            guard selectedNumbers.count < 4 else {
                return
            }
            selectedNumbers += keys[indexPath.item]
            asteriks += "*"
            asteriksLabel.text = asteriks
        }
    }
    
}
