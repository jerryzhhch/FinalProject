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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @IBAction func okayButtonTapped(_ sender: UIButton) {
        if checkboxOne.isSelected {
            print("Button 1")
        }
        if checkboxTwo.isSelected {
            print("Button 2")
        }
        if checkboxThree.isSelected {
            print("Button 3")
        }
        if checkboxFour.isSelected {
            print("Button 4")
        }
    }
    
    @IBAction func checkboxOneSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func checkboxTwoSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func checkboxThreeSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func checkboxFourSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    // helping func
    func setupView() {
        
    }
    
    
} // end class
