/*
 
 House Collection Cell - show contents of collection cells used by colletion view in HouseViewController
 
 Technology:
 UICollectionViewCell
 
 */

import UIKit

class HouseCollectionCell: UICollectionViewCell {
    
    static let identifier = "HouseCollectionCell"
    
    @IBOutlet weak var houseImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = 20
    }
    
    override var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? .lightGray : UIColor(white: 0.7, alpha: 1)
        }
    }
    
    func config(house: House) {
        houseImage.frame.size = self.frame.size
        houseImage.image = UIImage(named: house.name)
    }
    
} // end class
