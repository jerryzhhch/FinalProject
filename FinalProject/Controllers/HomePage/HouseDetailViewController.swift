/*
 
 House Detail View Controller - manages House Detail view
 
 Technology:
 IBAction for UIButton
 applying House view model by design pattern: dependency injection
 
 */

import UIKit

class HouseDetailViewController: UIViewController {

    @IBOutlet weak var houseTitle: UILabel!
    @IBOutlet weak var mascotLabel: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var ghostLabel: UILabel!
    @IBOutlet weak var founderLabel: UILabel!
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseWords: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var mascotImage: UIImageView!
    
    var viewModel = HouseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // helping func
    func setupView() {
        houseTitle.text = viewModel.currentHouse.name + " House"
        
        mascotLabel.text = "Mascot:\n\(viewModel.currentHouse.mascot)"

        headLabel.text = "Head of House:\n\(viewModel.currentHouse.headOfHouse)"
        
        ghostLabel.text = "House Ghost:\n\(viewModel.currentHouse.headOfHouse)"
        
        founderLabel.text = "Founder:\n\(viewModel.currentHouse.founder)"
        
        valueLabel.text = "Value:\n\(viewModel.currentHouse.values.joined(separator: ", "))"
        
        colorLabel.text = "Color:\n\(viewModel.currentHouse.colors.joined(separator: ", "))"
        
        switch viewModel.currentHouse.name {
        case "Gryffindor":
            houseWords.text = Constants.houseWords.Gryffindor.rawValue
            houseImage.image = UIImage(named: Constants.defaultImage.GryffindorFlag.rawValue)
            mascotImage.image = UIImage(named: Constants.defaultImage.GryffindorFlag.rawValue)
        case "Ravenclaw":
            houseWords.text = Constants.houseWords.Ravenclaw.rawValue
            houseImage.image = UIImage(named: Constants.defaultImage.RavenclawFlag.rawValue)
            mascotImage.image = UIImage(named: Constants.defaultImage.RavenclawMascot.rawValue)
        case "Slytherin":
            houseWords.text = Constants.houseWords.Slytherin.rawValue
            houseImage.image = UIImage(named: Constants.defaultImage.SlytherinFlag.rawValue)
            mascotImage.image = UIImage(named: Constants.defaultImage.SlytherinMascot.rawValue)
        case "Hufflepuff":
            houseWords.text = Constants.houseWords.Hufflepuff.rawValue
            houseImage.image = UIImage(named: Constants.defaultImage.HufflepuffFlag.rawValue)
            mascotImage.image = UIImage(named: Constants.defaultImage.HufflepuffMascot.rawValue)
        default:
            break
        }
    }
  
} // end class
