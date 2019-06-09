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
    
    var viewModel = SpellViewModel()
    let fireModel = FireViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fireModel.getFire()
        setupView()
    }

    @IBAction func learnButtonTapped(_ sender: UIButton) {
        print("learning...")
        // No more than 5 spells
        if fireModel.spells.count == 5 {
            showAlert(title: "Whoops", message: "You can only learn five spells at this time")
        } else {
            fireService.save(spell: viewModel.currentSpell)
            DispatchQueue.main.async {
                self.learnedIcon.isHidden = false
            }
        }
        fireModel.getFire()
    }
    
    @IBAction func forgetButtonTapped(_ sender: UIButton) {
        print("forget")
        fireService.remove(spell: viewModel.currentSpell)
        DispatchQueue.main.async {
            self.learnedIcon.isHidden = true
        }
        fireModel.getFire()
    }
    
    
    
    // helping func
    func setupView() {
        titleLabel.text = viewModel.currentSpell.spell
        typeLabel.attributedText = viewModel.currentSpell.type.makeBold(boldText: "Type:\n")
        descriptionLabel.attributedText = viewModel.currentSpell.effect.makeBold(boldText: "Effect:\n")
        learnedIcon.layer.cornerRadius = 15
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: Notification.Name.FireNotification, object: nil)
    }
    
    @objc func updateView() {
        if fireModel.isExisted(spell: viewModel.currentSpell) {
            DispatchQueue.main.async {
                self.learnedIcon.isHidden = false
            }
        } else {
            learnedIcon.isHidden = true
        }
    }

} // end class
