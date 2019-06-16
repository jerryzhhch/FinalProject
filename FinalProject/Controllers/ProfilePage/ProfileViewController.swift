/*
 
 Profile View Controller - manages user profile page
 
 Technology:
 UITableView - different editing styles for multiple table views
 applying view model by communitication pattern: notification and design pattern: singleton pattern
 UIImagePickerController - access local gallery
 FileManager - save and load image by file path
 
 */

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var spellsTable: UITableView!
    @IBOutlet weak var classmatesTable: UITableView!
    @IBOutlet weak var imageButton: UIButton!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    let fireModel = FireViewModel()
    let charModel = CharacterViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        charModel.getCharacters()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fireModel.getFire()
        // disable editing once user comes back from other view controllers
        if spellsTable.isEditing {
            spellsTable.isEditing.toggle()
            imageButton.isHidden = true
        }
        setImage()
    }
    
    // enable editing
    @IBAction func editButtonTapped(_ sender: UIButton) {
        spellsTable.isEditing.toggle()
        if spellsTable.isEditing {
            imageButton.isHidden = false
        } else {
            imageButton.isHidden = true
        }
    }
    
    // change image from photo library
    @IBAction func imageButtonTapped(_ sender: UIButton) {
        let imageController = UIImagePickerController()
        imageController.sourceType = .photoLibrary
        imageController.delegate = self
        present(imageController, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // helping func
    func setupView() {
        spellsTable.register(UINib(nibName: SpellTableCell.identifier, bundle: .main), forCellReuseIdentifier: SpellTableCell.identifier)
        classmatesTable.register(UINib(nibName: CharTableCell.identifier, bundle: .main), forCellReuseIdentifier: CharTableCell.identifier)
        
        
        profileImage.layer.cornerRadius = 20
        
        imageButton.layer.cornerRadius = 5
        imageButton.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateSpells), name: Notification.Name.FireNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateClassmates), name: Notification.Name.CharacterNotificationTwo, object: nil)
        
        nameLabel.text = "Name: " + UserSettings.getName()
        let dob = UserSettings.getBirth()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: dob)
        let month = calendar.component(.month, from: dob)
        let day = calendar.component(.day, from: dob)
        let dobString = "\(month)/\(day)/\(year)"
        dobLabel.text = "DOB: " + dobString
        houseLabel.text = "House: " + UserSettings.getHouse()
        
        if UserSettings.getDeathEater() {
            iconImage.image = UIImage(named: Constants.defaultImage.DeathEater.rawValue)
        }
        if UserSettings.getOrderOfThePhoenix() {
            iconImage.image = UIImage(named: Constants.defaultImage.OrderOfThePhoenix.rawValue)
        }
        if UserSettings.getMinistryOfMagic() {
            iconImage.image = UIImage(named: Constants.defaultImage.MinistryOfMagic.rawValue)
        }
        if UserSettings.getDumbledoresArmy() {
            iconImage.image = UIImage(named: Constants.defaultImage.DumbledoresArmy.rawValue)
        }
    }
    
    @objc func updateSpells() {
        DispatchQueue.main.async {
            self.spellsTable.reloadData()
        }
    }
    
    @objc func updateClassmates() {
        DispatchQueue.main.async {
            self.classmatesTable.reloadData()
        }
    }
    
    // get classmates
    func getClassmates() -> [Character] {
        let houseKey = UserSettings.getHouse()
        guard let classmates = charModel.groupedCharByHouse[houseKey] else {
            return []
        }
        return classmates
    }
    
    // set profile image
    func setImage() {
        let hash = UserSettings.getImageHash()
        guard let url = Utility.load(hash: hash) else {
            return
        }
        guard let image = UIImage(contentsOfFile: url.path) else {
            profileImage.image = #imageLiteral(resourceName: "ProfilePlaceholder")
            return
        }
        profileImage.image = image
    }
    
    
} // end class


// Extensions: UITableView
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    // number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case spellsTable:
            return fireModel.spells.count
        default:
            return getClassmates().count
        }
    }
    
    // cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case spellsTable:
            return 40
        default:
            return 70
        }
    }
    
    // set section header
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .orange
        tableView.backgroundColor = .lightGray
    }
    
    // section header title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch tableView {
        case spellsTable:
            return "Learned Spells"
        default:
            return "House Members"
        }
    }
    
    // set table cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case spellsTable:
            let cell = tableView.dequeueReusableCell(withIdentifier: SpellTableCell.identifier, for: indexPath) as! SpellTableCell
            let spell = fireModel.spells[indexPath.row]
            cell.config(spell: spell)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: CharTableCell.identifier, for: indexPath) as! CharTableCell
            let classmate = getClassmates()[indexPath.row]
            cell.config(char: classmate)
            return cell
        }
    }
    
    // select table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch tableView {
        case spellsTable:
            let spell = fireModel.spells[indexPath.row]
            goToDetail(nav: navigationController!, object: spell, type: "spell")
        default:
            let char = getClassmates()[indexPath.row]
            goToDetail(nav: navigationController!, object: char, type: "character")
        }
    }
    
    // editing spells
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch tableView {
        case spellsTable:
            switch editingStyle {
            case .delete:
                fireService.remove(spell: fireModel.spells[indexPath.row])
                fireModel.getFire()
            default:
                break
            }
        default:
            break
        }
    }
    
    // set different editing style for multiple table views
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        switch tableView {
        case spellsTable:
            return UITableViewCell.EditingStyle.delete
        default:
            return UITableViewCell.EditingStyle.none
        }
    }
    
}

// Extensions: UIPickerControllerDelegate
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // did select new image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage, let data = image.pngData() else {
            return
        }
        Utility.save(data: data)
        let hash = String(data.hashValue)
        UserSettings.saveImageHash(hash: hash)
        picker.dismiss(animated: true, completion: nil)
    }
}
