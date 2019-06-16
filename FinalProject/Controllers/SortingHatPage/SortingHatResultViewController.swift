//
//  SortingHatResultViewController.swift
//  FinalProject
//
//  Created by Jerry Zhou on 6/14/19.
//  Copyright © 2019 Jerry Zhou. All rights reserved.
//

import UIKit

class SortingHatResultViewController: UIViewController {

    @IBOutlet weak var resultImage: UIImageView!
    
    var house: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // helping function
    func setupView() {
        switch house {
        case "Gryffindor":
            resultImage.image = UIImage(named: Constants.houseName.Gryffindor.rawValue)
        case "Ravenclaw":
            resultImage.image = UIImage(named: Constants.houseName.Ravenclaw.rawValue)
        case "Hufflepuff":
            resultImage.image = UIImage(named: Constants.houseName.Hufflepuff.rawValue)
        case "Slytherin":
            resultImage.image = UIImage(named: Constants.houseName.Slytherin.rawValue)
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if touch.view == self.view {
            dismiss(animated: false, completion: nil)
        }
    }
    
} // end class
