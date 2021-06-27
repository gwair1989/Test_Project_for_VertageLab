//
//  MapVC.swift
//  Test Project for VertageLab
//
//  Created by Aleksandr Khalupa on 26.06.2021.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController,TPManagerDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myMapView: UIView!
    
    var userName = ""
    let tpManager = TPManager()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tpManager.delegate = self
        navigationItem.title = userName
        tpManager.requestData()
        tableView.dataSource = self
    }
    
    //    MARK: - Creates marker
    func getData(data: [TPModel]) {
        
        let camera = GMSCameraPosition.camera(withLatitude: data[1].lat, longitude: data[1].lng, zoom: 14.5)
        let mapView = GMSMapView.map(withFrame: self.myMapView.frame, camera: camera)
        
        let marker0 = GMSMarker()
        marker0.position = CLLocationCoordinate2D(latitude: data[0].lat, longitude: data[0].lng)
        marker0.title = data[0].name
        marker0.map = mapView
        self.myMapView.addSubview(mapView)
        
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: data[1].lat, longitude: data[1].lng)
        marker1.title = data[1].name
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: data[2].lat, longitude: data[2].lng)
        marker2.title = data[2].name
        marker2.map = mapView
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "1: Independence Square"
        return cell
    }
    
    
}
