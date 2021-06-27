//
//  TPData.swift
//  Test Project for VertageLab
//
//  Created by Aleksandr Khalupa on 27.06.2021.
//

import Foundation

struct TPData:Codable {
    let places:[JSONData]
}

struct JSONData:Codable {
    let id: Int
    let name: String
    let lat:Double
    let lng:Double
}
