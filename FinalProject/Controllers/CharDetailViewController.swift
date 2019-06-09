

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
    
    var viewModel = CharacterViewModel()
    private var iconHolder = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    // helping func
    func setupView() {
        
        nameLabel.attributedText = viewModel.currentChar.name.makeBold(boldText: "Name:\n")
        speciesLabel.attributedText = viewModel.currentChar.species.makeBold(boldText: "Species:\n")
        roleLabel.attributedText = viewModel.currentChar.role.makeBold(boldText: "Role:\n")
        houseLabel.attributedText = viewModel.currentChar.house.makeBold(boldText: "House:\n")
        schoolLabel.attributedText = viewModel.currentChar.school.makeBold(boldText: "School:\n")
        bloodLabel.attributedText = viewModel.currentChar.bloodStatus.makeBold(boldText: "Blood Status:\n")
        
        DispatchQueue.main.async {
            self.charImage.image = UIImage(named: Constants.defaultImage.DefaultCharacter.rawValue)

        }
        if !viewModel.currentChar.deathEater {
            wantedImage.isHidden = true
        }
        
        if viewModel.currentChar.ministryOfMagic {
            iconHolder.append(Constants.defaultImage.MinistryOfMagic.rawValue)
        }
        if viewModel.currentChar.orderOfThePhoenix {
            iconHolder.append(Constants.defaultImage.OrderOfThePhoenix.rawValue)
        }
        if viewModel.currentChar.dumbledoresArmy {
            iconHolder.append(Constants.defaultImage.DumbledoresArmy.rawValue)
        }
        if viewModel.currentChar.deathEater {
            iconHolder.append(Constants.defaultImage.DeathEater.rawValue)
        }
        
        setIcons(imageString: iconHolder)
        
    }
    
    // helping func
    func setIcons(imageString: [String]) {
        print(imageString)
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
