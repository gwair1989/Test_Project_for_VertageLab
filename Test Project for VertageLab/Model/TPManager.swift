//
//  TPManager.swift
//  Test Project for VertageLab
//
//  Created by Aleksandr Khalupa on 27.06.2021.
//

import Foundation

protocol TPManagerDelegate {
    func getData(data: [TPModel])
}

class TPManager {
    var delegate:TPManagerDelegate?
    let apiURL = "https://2fjd9l3x1l.api.quickmocker.com/kyiv/places"
    
    
    func requestData(){
        guard let dataURL = URL(string: apiURL) else{return}
        let urlSession = URLSession(configuration: .default)
        let dataTask = urlSession.dataTask(with: dataURL) { (data, urlResponse, error) in
            if error != nil{return}
            guard let receivedData = data else{return}
            guard let tpModel = self.hendlingJson(recData: receivedData) else {return}
            DispatchQueue.main.async {
                self.delegate?.getData(data: tpModel)
            }
        }
        dataTask.resume()
    }
    
    func hendlingJson(recData:Data) -> [TPModel]?{
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(TPData.self, from: recData)
            let tpModel = [
                TPModel(id: decodeData.places[0].id, name: decodeData.places[0].name, lat: decodeData.places[0].lat, lng: decodeData.places[0].lng),
                TPModel(id: decodeData.places[1].id, name: decodeData.places[1].name, lat: decodeData.places[1].lat, lng: decodeData.places[1].lng),
                TPModel(id: decodeData.places[2].id, name: decodeData.places[2].name, lat: decodeData.places[2].lat, lng: decodeData.places[2].lng)
            ]
            return tpModel
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
