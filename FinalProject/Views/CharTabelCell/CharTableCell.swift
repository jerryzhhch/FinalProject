/*
 
 Character Table Cell - show contents of table cells used by table view in CharViewController and ***
 
 Technology:
 UITableViewCell
 xib cell
 
 */

import UIKit

class CharTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    static let identifier = "CharTableCell"
    
    func config(char: Character) {
        nameLabel.text = char.name
        DispatchQueue.main.async {
            self.profileImage.image = UIImage(named: Constants.defaultImage.DefaultProfile.rawValue)
        }
    }
    
} // end class
