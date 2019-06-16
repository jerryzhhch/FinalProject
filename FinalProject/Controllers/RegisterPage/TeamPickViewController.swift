//
//  TeamPickViewController.swift
//  FinalProject
//
//  Created by Jerry Zhou on 6/13/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

class TeamPickViewController: UIViewController {

    @IBOutlet weak var checkboxOne: UIButton!
    @IBOutlet weak var checkboxTwo: UIButton!
    @IBOutlet weak var checkboxThree: UIButton!
    @IBOutlet weak var checkboxFour: UIButton!
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageFour: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @IBAction func okayButtonTapped(_ sender: UIButton) {
        if checkboxOne.isSelected {
            UserSettings.saveOrderOfThePhoenix(member: true)
        }
        if checkboxTwo.isSelected {
            UserSettings.saveDeathEater(member: true)
        }
        if checkboxThree.isSelected {
            UserSettings.saveMinistryOfMagic(member: true)
        }
        if checkboxFour.isSelected {
            UserSettings.saveDumbledoresArmy(member: true)
        }
        
        checkboxOne.isSelected = false
        checkboxTwo.isSelected = false
        checkboxThree.isSelected = false
        checkboxFour.isSelected = false
        
        // save registration status
        UserSettings.saveRegStatus(first: false)
        
        test()
    }
    
    @IBAction func checkboxOneSelected(_ sender: UIButton) {
        switch checkboxOne.isSelected {
        case false:
            checkboxTwo.isSelected = false
            checkboxThree.isSelected = false
            checkboxFour.isSelected = false
        default:
            break
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func checkboxTwoSelected(_ sender: UIButton) {
        switch checkboxTwo.isSelected {
        case false:
            checkboxOne.isSelected = false
            checkboxThree.isSelected = false
            checkboxFour.isSelected = false
        default:
            break
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func checkboxThreeSelected(_ sender: UIButton) {
        switch checkboxThree.isSelected {
        case false:
            checkboxOne.isSelected = false
            checkboxTwo.isSelected = false
            checkboxFour.isSelected = false
        default:
            break
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func checkboxFourSelected(_ sender: UIButton) {
        switch checkboxFour.isSelected {
        case false:
            checkboxOne.isSelected = false
            checkboxTwo.isSelected = false
            checkboxThree.isSelected = false
        default:
            break
        }
        sender.isSelected = !sender.isSelected
    }
    
    // helping func
    func setupView() {
    }
    
    
} // end class
