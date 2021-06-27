//
//  MapVC.swift
//  Test Project for VertageLab
//
//  Created by Aleksandr Khalupa on 26.06.2021.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: UIView!
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = userName
        GMSServices.provideAPIKey("\(K.key)")
        let camera = GMSCameraPosition.camera(withLatitude: 50.450555, longitude: 30.5210808, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: self.mapView.frame, camera: camera)
        self.mapView.addSubview(mapView)
        createsMarker(lat: 50.450555, lon: 30.5210808, names: "Independence Square", map: mapView)
        tableView.dataSource = self
    }
    
    //    MARK: - Creates marker
    func createsMarker(lat:Double, lon:Double, names:String, map:GMSMapView){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = names
        marker.map = map
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "1: Independence Square"
        return cell
    }
}
