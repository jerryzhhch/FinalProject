
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
        NotificationCenter.default.addObserver(self, selector: #selector(upsdateView), name: Notification.Name.CharacterNotification, object: nil)
        
        characterTableView.register(UINib(nibName: CharTableCell.identifier, bundle: .main), forCellReuseIdentifier: CharTableCell.identifier)
        
        characterTableView.tableFooterView = UIView(frame: .zero)
    }
    
    @objc func upsdateView() {
        DispatchQueue.main.async {
            self.characterTableView.reloadData()
        }
    }

    func getCharsBySection(section: Int) -> [Character] {
        let keys = charModel.groupedCharacters.keys.sorted(by: {$0 < $1})
        let key = keys[section]
        return charModel.groupedCharacters[key]!
    }
    
} //end class


// Extensions: UITableView
extension CharViewController: UITableViewDelegate, UITableViewDataSource {
    // number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return charModel.groupedCharacters.keys.count
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
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 20))
//        header.backgroundColor = .orange
//        return header
//    }
    
    // section header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return charModel.groupedCharacters.keys.sorted(by: {$0 < $1})[section]
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
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let detailVC = storyboard.instantiateViewController(withIdentifier: "CharDetailViewController") as! CharDetailViewController
        let char = getCharsBySection(section: indexPath.section)[indexPath.row]
        charModel.currentChar = char
        detailVC.viewModel = self.charModel
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    //
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let groupedChar = Dictionary(grouping: charModel.characters, by: {$0.name.prefix(1).uppercased()})
        let keys = groupedChar.keys.sorted(by: {$0 < $1})
        return keys
    }
}
