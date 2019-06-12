

import UIKit

class AuthHeaderCollectionCell: UICollectionViewCell {

   static let identifier = "AuthHeaderCollectionCell"

    @IBOutlet weak var headerLabel: UILabel!
    
    func config(label: String) {
        headerLabel.text = label
    }
}
