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
        print(viewModel.currentHouse.name)
        houseTitle.text = viewModel.currentHouse.name + " House"
        mascotLabel.attributedText = viewModel.currentHouse.mascot.makeBold(boldText: "Mascot:\n")
        headLabel.attributedText = viewModel.currentHouse.headOfHouse.makeBold(boldText: "Head of House:\n")
        ghostLabel.attributedText = viewModel.currentHouse.houseGhost.makeBold(boldText: "House Ghost:\n")
        founderLabel.attributedText = viewModel.currentHouse.founder.makeBold(boldText: "Founder:\n")
        valueLabel.attributedText = viewModel.currentHouse.values.joined(separator: ", ").makeBold(boldText: "Value:\n")
        colorLabel.attributedText = viewModel.currentHouse.colors.joined(separator: ", ").makeBold(boldText: "Color:\n")
        
        switch viewModel.currentHouse.name {
        case "Gryffindor":
            houseWords.text = Constants.houseWords.Gryffindor.rawValue
            houseImage.image = #imageLiteral(resourceName: "GryffindorFlag")
            mascotImage.image = #imageLiteral(resourceName: "GryffindorMascot")
        case "Ravenclaw":
            houseWords.text = Constants.houseWords.Ravenclaw.rawValue
            houseImage.image = #imageLiteral(resourceName: "RavenclawFlag")
            mascotImage.image = #imageLiteral(resourceName: "RavenclawMascot")
        case "Slytherin":
            houseWords.text = Constants.houseWords.Slytherin.rawValue
            houseImage.image = #imageLiteral(resourceName: "SlytherinFlag")
            mascotImage.image = #imageLiteral(resourceName: "SlytherinMascot")
        case "Hufflepuff":
            houseWords.text = Constants.houseWords.Hufflepuff.rawValue
            houseImage.image = #imageLiteral(resourceName: "HufflepuffFlag")
            mascotImage.image = #imageLiteral(resourceName: "HufflepuffMascot")
        default:
            break
        }
    }


    
    
} // end class
