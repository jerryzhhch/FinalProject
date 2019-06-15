/*
 
 Character Detail View Controller - manages Character Detail view
 
 Technology:
 IBAction for UIButton
 applying Character view model by design pattern: dependency injection
 
 */

import UIKit

class CharDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var bloodLabel: UILabel!
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var wantedImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    @IBOutlet weak var fourthImage: UIImageView!
    
    var character: Character!
    private var iconHolder = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    // helping func
    func setupView() {
        nameLabel.text = "Name:\n\(character.name)"
        
        speciesLabel.text = "Species:\n\(character.species)"
        
        roleLabel.text = "Role:\n\(character.role)"
            
        houseLabel.text = "House:\n\(character.house)"
            
        schoolLabel.text = "School:\n\(character.school)"
        
        bloodLabel.text = "Blood Status:\n\(character.bloodStatus)"
        
        DispatchQueue.main.async {
            self.charImage.image = UIImage(named: Constants.defaultImage.DefaultCharacter.rawValue)
        }
        
        if !character.deathEater {
            wantedImage.isHidden = true
        }
        if character.ministryOfMagic {
            iconHolder.append(Constants.defaultImage.MinistryOfMagic.rawValue)
        }
        if character.orderOfThePhoenix {
            iconHolder.append(Constants.defaultImage.OrderOfThePhoenix.rawValue)
        }
        if character.dumbledoresArmy {
            iconHolder.append(Constants.defaultImage.DumbledoresArmy.rawValue)
        }
        if character.deathEater {
            iconHolder.append(Constants.defaultImage.DeathEater.rawValue)
        }
        
        setIcons(imageString: iconHolder)
    }
    
    // helping func
    func setIcons(imageString: [String]) {
        let count = imageString.count
        switch count {
        case 1:
            DispatchQueue.main.async {
                self.firstImage.image = UIImage(named: imageString[0])
                self.secondImage.isHidden = true
                self.thirdImage.isHidden = true
                self.fourthImage.isHidden = true
            }
        case 2:
            DispatchQueue.main.async {
                self.firstImage.image = UIImage(named: imageString[0])
                self.secondImage.image = UIImage(named: imageString[1])
                self.thirdImage.isHidden = true
                self.fourthImage.isHidden = true
            }
        case 3:
            DispatchQueue.main.async {
                self.firstImage.image = UIImage(named: imageString[0])
                self.secondImage.image = UIImage(named: imageString[1])
                self.thirdImage.image = UIImage(named: imageString[2])
                self.fourthImage.isHidden = true
            }
        case 4:
            DispatchQueue.main.async {
                self.firstImage.image = UIImage(named: imageString[0])
                self.secondImage.image = UIImage(named: imageString[1])
                self.thirdImage.image = UIImage(named: imageString[2])
                self.fourthImage.image = UIImage(named: imageString[3])
            }
        default:
            self.firstImage.isHidden = true
            self.secondImage.isHidden = true
            self.thirdImage.isHidden = true
            self.fourthImage.isHidden = true
        }
    }
    
} // end class
