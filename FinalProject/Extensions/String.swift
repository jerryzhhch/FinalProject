/*
 
 Extension for String - makes string to be bold followed by regular string
 
 Technology:
 NSMutableAttributedString
 
 */

import UIKit

extension String {
    
    func makeBold(boldText: String) -> NSMutableAttributedString {
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let boldString = NSMutableAttributedString(string:boldText, attributes:attrs)
        let normalString = NSMutableAttributedString(string:self)
        boldString.append(normalString)
        return boldString
    }
    
}
