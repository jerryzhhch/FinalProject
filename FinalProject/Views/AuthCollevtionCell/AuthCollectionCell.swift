

import UIKit

class AuthCollectionCell: UICollectionViewCell {
    
    static let identifier = "AuthCollectionCell"
    
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = layer.frame.height / 2
        backgroundColor = UIColor(white: 0.9, alpha: 1)
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .lightGray : UIColor(white: 0.9, alpha: 1)
            buttonLabel.textColor = isHighlighted ? .white : .darkGray
        }
    }
    
    
    func config(text: String) {
        switch text {
        case "done":
            buttonImage.image = UIImage(named: text)
            buttonLabel.isHidden = true
        case "backspace":
            buttonImage.image = UIImage(named: text)
            buttonLabel.isHidden = true
        default:
            buttonLabel.text = text
            buttonImage.isHidden = true
        }
    }
    
    
} // end class
