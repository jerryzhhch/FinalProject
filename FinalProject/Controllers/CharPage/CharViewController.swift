/*
 
 Characters View Controller - manages Characters table view
 
 Technology:
 UITableView - sets sections, section header, table cells in each section, and section index title
 applying view model by communitication pattern: notification and design pattern: singleton pattern
 
 */

import UIKit

class CharViewController: UIViewController {

    @IBOutlet weak var characterTableView: UITableView!
    
    let charModel = CharacterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        charModel.getCharacters()
        setupView()
    }
    
    // helping func
    func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(upsdateView), name: Notification.Name.CharacterNotificationOne, object: nil)
        
        characterTableView.register(UINib(nibName: CharTableCell.identifier, bundle: .main), forCellReuseIdentifier: CharTableCell.identifier)
        
        characterTableView.tableFooterView = UIView(frame: .zero)
    }
    
    @objc func upsdateView() {
        DispatchQueue.main.async {
            self.characterTableView.reloadData()
        }
    }

    // get characters from each section
    func getCharsBySection(section: Int) -> [Character] {
        let keys = charModel.groupedCharByIndex.keys.sorted(by: {$0 < $1})
        let key = keys[section]
        return charModel.groupedCharByIndex[key]!
    }
    
} //end class


// Extensions: UITableView
extension CharViewController: UITableViewDelegate, UITableViewDataSource {
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return charModel.groupedCharByIndex.keys.count
    }
    
    // number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getCharsBySection(section: section).count
    }
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // set section header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .lightGray
    }
    
    // section header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return charModel.groupedCharByIndex.keys.sorted(by: {$0 < $1})[section]
    }
    
    // set table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharTableCell.identifier, for: indexPath) as! CharTableCell
        let chars = getCharsBySection(section: indexPath.section)
        let char = chars[indexPath.row]
        cell.config(char: char)
        return cell
    }
    
    // select table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let char = getCharsBySection(section: indexPath.section)[indexPath.row]
        goToDetail(nav: navigationController!, object: char, type: "character")
    }
    
    // enbale side index bar
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let groupedChar = Dictionary(grouping: charModel.characters, by: {$0.name.prefix(1).uppercased()})
        let keys = groupedChar.keys.sorted(by: {$0 < $1})
        return keys
    }
}
