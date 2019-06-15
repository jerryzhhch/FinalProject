/*
 
 Spell Detail View Controller - manages Spell Detail view
 
 Technology:
 IBAction for UIButton
 applying Firebase view model by communitication pattern: notification and design pattern: singleton pattern
 applying Spell view model by design pattern: dependency injection
 
 */

import UIKit

class SpellDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var learnedIcon: UILabel!
    @IBOutlet weak var learnButton: UIButton!
    @IBOutlet weak var learnLabel: UILabel!
    @IBOutlet weak var forgetButton: UIButton!
    @IBOutlet weak var forgetLabel: UILabel!
    
    var spell: Spell!
    let fireModel = FireViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fireModel.getFire()
        setupView()
    }

    @IBAction func learnButtonTapped(_ sender: UIButton) {
        // No more than limits
        if fireModel.spells.count == UserSettings.getLimit() {
            showAlert(title: "Whoops", message: "You can only learn five spells at this time")
        } else {
            fireService.save(spell: spell)
            DispatchQueue.main.async {
                self.learnedIcon.isHidden = false
            }
        }
        fireModel.getFire()
    }
    
    @IBAction func forgetButtonTapped(_ sender: UIButton) {
        fireService.remove(spell: spell)
        DispatchQueue.main.async {
            self.learnedIcon.isHidden = true
        }
        fireModel.getFire()
    }
  
    // helping func
    func setupView() {
        titleLabel.text = spell.spell
        
        typeLabel.text = "Type:\n\(spell.type)"
        
        descriptionLabel.text = "Effect:\n\(spell.effect)"
        
        learnedIcon.layer.cornerRadius = 15
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: Notification.Name.FireNotification, object: nil)
    }
    
    @objc func updateView() {
        if fireModel.isExisted(spell: spell) {
            DispatchQueue.main.async {
                self.learnedIcon.isHidden = false
            }
        } else {
            learnedIcon.isHidden = true
        }
    }

} // end class
