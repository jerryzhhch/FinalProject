/*
 
 Spells View Controller - manages Spells Searching view
 
 Technology:
 UITableView - sets sections, section header, and table cells in each section
 UISearchBar - filters the table results
 applying view model by communitication pattern: delegation and design pattern: singleton pattern
 
 */

import UIKit

class SpellsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var spellTableView: UITableView!
    
    let spellModel = SpellViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        spellModel.getSpells()
        setupView()
    }
    
    // helping func
    func setupView() {
        spellTableView.register(UINib(nibName: SpellTableCell.identifier, bundle: .main), forCellReuseIdentifier: SpellTableCell.identifier)
        
        spellTableView.tableFooterView = UIView(frame: .zero)
        
        searchBar.placeholder = "Search spells ..."
        
        spellModel.delegate = self
    }
    
    func getSpellsBySection(section: Int) -> [Spell] {
        let keys = spellModel.groupedSpells.keys.sorted(by: {$0 < $1})
        let key = keys[section]
        return spellModel.groupedSpells[key]!
    }
    
    func isFiltering() -> Bool {
        return searchBar.text!.isEmpty ? false : true
    }
    
} // end class


// Extensions: UITableView
extension SpellsViewController: UITableViewDelegate, UITableViewDataSource {
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return isFiltering() ? 1 : spellModel.groupedSpells.keys.count
    }
    
    // number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let spells = getSpellsBySection(section: section)
        return isFiltering() ? spellModel.filteredSpells.count : spells.count
    }
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // set section header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font = UIFont(descriptor: UIFontDescriptor(name: "Italic", size: 25), size: 15)
        header.textLabel?.textAlignment = NSTextAlignment.center
    }
    
    // section header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keys = spellModel.groupedSpells.keys.sorted(by: {$0 < $1})
        return isFiltering() ? nil : keys[section]
    }
    
    // set table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SpellTableCell.identifier, for: indexPath) as! SpellTableCell
        let spell = isFiltering() ? spellModel.filteredSpells[indexPath.row] : getSpellsBySection(section: indexPath.section)[indexPath.row]
        cell.config(spell: spell)
        return cell
    }
    
    // select table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let spell = isFiltering() ? spellModel.filteredSpells[indexPath.row] : getSpellsBySection(section: indexPath.section)[indexPath.row]
        goToDetail(nav: navigationController!, object: spell, type: "spell")
    }
}

// UISearchBar
extension SpellsViewController: UISearchBarDelegate  {
    // text did change
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.showsCancelButton = true
        guard let text = searchBar.text else {return}
        
        spellModel.filteredSpells = spellModel.spells.filter({
            $0.spell.lowercased().contains(text.lowercased())
        })
        
        spellTableView.reloadData()
    }
    
    // search button clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    // cancel button clicked
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text?.removeAll()
        searchBar.showsCancelButton = false
    }
    
    // text did begin editing
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
}

// ViewModel delegate
extension SpellsViewController: ViewModelDelegate {
    func updateView() {
        DispatchQueue.main.async {
            self.spellTableView.reloadData()
        }
    }
}
