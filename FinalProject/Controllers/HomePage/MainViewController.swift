/*
 
 Main View Controller - manages MAIN view
 
 Technology:
 UICollectionView - sets cell, configure cell sizes
 applying view model with communitication pattern: notification and design pattern: singleton pattern
 
 */

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var houseCollectionView: UICollectionView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let houseModel = HouseViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        houseModel.getHouses()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        test()
    }
    
    // helping func
    func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: Notification.Name.HouseNotification, object: nil)
    }
    
    @objc func updateView() {
        DispatchQueue.main.async {
            self.houseCollectionView.reloadData()
            print("Collection view is reloaded")
        }
    }
    
} // end class


// Extensions:
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // number of item in a section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return houseModel.houses.count
    }
    
    // set collection cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HouseCollectionCell.identifier, for: indexPath) as! HouseCollectionCell
        let house = houseModel.houses[indexPath.row]
        cell.config(house: house)
        return cell
    }
    
    // size for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width - 90) / 2
        let height = (collectionView.frame.size.height - 80) / 2
        return .init(width: width, height: height)
    }
    
    // inset for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50, left: 30, bottom: 30, right: 30)
    }
    
    // minimum inter item spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    // select a cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Detail", bundle: .main)
        let houseDetialVC = storyboard.instantiateViewController(withIdentifier: "HouseDetailViewController") as! HouseDetailViewController
        let house = houseModel.houses[indexPath.row]
        houseModel.currentHouse = house
        houseDetialVC.viewModel = self.houseModel
        navigationController?.pushViewController(houseDetialVC, animated: true)
    }
}

