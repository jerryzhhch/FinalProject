/*
 
 Splash View Controller - controls which view controller user should go to
 
 Technology:
 
 */

import UIKit

class SplashViewController: UIViewController {

    private let appdelegate = UIApplication.shared.delegate as! AppDelegate
    private let _storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserSettings.getRegStatus() {
            let viewController = _storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
            appdelegate.window?.rootViewController = viewController
        } else {
            let tabController = _storyboard.instantiateViewController(withIdentifier: "MainTabController") as! UITabBarController
            appdelegate.window?.rootViewController = tabController
        }
    }

} // end class
