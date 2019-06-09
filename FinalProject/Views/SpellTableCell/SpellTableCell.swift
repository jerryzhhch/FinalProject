/*
 
 Spell Table Cell - show contents of table cells used by table view in SpellViewController and ***
 
 Technology:
 UITableViewCell
 xib cell
 
 */

import UIKit

class SpellTableCell: UITableViewCell {

    @IBOutlet weak var spellLabel: UILabel!
    
    static let identifier = "SpellTableCell"
    
    func config(spell: Spell) {
        spellLabel.text = spell.spell
    }
    
} // end class
