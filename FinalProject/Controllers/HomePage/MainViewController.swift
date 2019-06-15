/*
 
 Main View Controller - manages MAIN view
 
 Technology:
 UICollectionView - sets cell, configure cell sizes
 applying view model with communitication pattern: notification and design pattern: singleton pattern
 
 */

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    @IBOutlet weak var videoView: UIImageView!
    @IBOutlet weak var houseCollectionView: UICollectionView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    let houseModel = HouseViewModel()
//    var player : AVPlayer!
    private var avPlayerLayer : AVPlayerLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        houseModel.getHouses()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        avPlayerLayer.frame = videoView.layer.bounds
//    }
    
    @IBAction func mapButtonTapped(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Detail", bundle: .main)
        let mapVC = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(mapVC, animated: true)
    }
    
    
    // helping func
    func setupView() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: Notification.Name.HouseNotification, object: nil)
        
//        guard let path = Bundle.main.path(forResource: "sample", ofType: ".mov") else {
//            print("No Video Found")
//            return
//        }
//
//        let player = AVPlayer(url: URL(fileURLWithPath: path))
//        avPlayerLayer = AVPlayerLayer(player: player)
//        avPlayerLayer.videoGravity = AVLayerVideoGravity.resize
//        videoView.layer.addSublayer(avPlayerLayer)
//        player.play()
        
       videoView.loadGif(name: "welcome")
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
        let size = collectionView.frame.width / 2.5
        return .init(width: size, height: size)
    }
    
    // inset for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10)
    }
    
    // minimum inter item spacing for section
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
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

