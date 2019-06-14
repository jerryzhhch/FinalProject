

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    // helping func
    func setupView() {
        // get random coordinates, round it to 7 digits precision
        let x = Double.random(in: -90 ... 90)
        let y = Double.random(in: -180 ... 180)
        let latitude = Double(round(10000000 * x)/10000000)
        let longitude = Double(round(10000000 * y)/10000000)
        print("latitude: ", latitude)
        print("longitude: ", longitude)
        
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region = MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        
        let location = MKPointAnnotation()
        location.coordinate = coordinates
        location.title = "Howgarts"
        
        mapView.addAnnotation(location)
        mapView.setRegion(region, animated: true)
        
    }

} // end class

// Latitudes range from -90 to 90. Longitudes range from -180 to 180
