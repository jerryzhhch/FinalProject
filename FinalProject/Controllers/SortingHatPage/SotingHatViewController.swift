/*
 
 SortingHat View Controller - manages SortingHat view
 
 Technology:
 IBAction for UIButton
 DispatchQueue - change label text every 3 seconds
 
 */

import UIKit

class SotingHatViewController: UIViewController {

    @IBOutlet weak var sortingHatButton: UIButton!
    @IBOutlet weak var songLabel: UILabel!
    
    private var index = 0
    private let song = [Constants.song.RavenclawSong.rawValue,
                Constants.song.SlytherinSong.rawValue,
                Constants.song.HufflepuffSong.rawValue,
                Constants.song.GryffindorSong.rawValue]
    private let houses = [Constants.houseName.Gryffindor.rawValue, Constants.houseName.Ravenclaw.rawValue, Constants.houseName.Hufflepuff.rawValue, Constants.houseName.Slytherin.rawValue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
   
    @IBAction func sortingHatButtonTapped(_ sender: UIButton) {
        guard let randomHouse = houses.randomElement() else {
            return
        }
        if getAge() < 7 {
            showAlert(title: nil, message: "Kid, you are too young to learn magic.\nWe will invite you when you are seven.")
        }
        if UserSettings.getHouse().isEmpty {
            UserSettings.saveHouse(house: randomHouse)
            let storyboard = UIStoryboard(name: "Detail", bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: "SortingHatResultViewController") as! SortingHatResultViewController
            vc.house = randomHouse
            present(vc, animated: true, completion: nil)
        } else {
            showAlert(title: nil, message: "You've already joined a House")
        }
    }
    
    // helping func
    func setupView() {
        songLabel.text = Constants.song.GryffindorSong.rawValue
        updateLabel()
    }

    // song changes every 3 seconds
    func updateLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.songLabel.text = self.song[self.index]
            
            if self.index == 3 {
                self.index = 0
            } else {
                self.index += 1
            }
            
            self.updateLabel()
        }
    }
    
    
} // end class
