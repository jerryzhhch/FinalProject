/*
 
 House Collection Cell - show contents of collection cells used by colletion view in HouseViewController
 
 Technology:
 UICollectionViewCell
 
 */

import UIKit

class HouseCollectionCell: UICollectionViewCell {
    
    static let identifier = "HouseCollectionCell"
    
    @IBOutlet weak var houseImage: UIImageView!
    
    func config(house: House) {
        houseImage.frame.size = self.frame.size
        houseImage.image = UIImage(named: house.name)
    }
    
} // end class
