//
//  Model1.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 03/05/23.
//

import Foundation

struct Model1: Codable {
    var id: Int
    var name: String
    var email: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var geo: Geo
}

struct Geo: Codable {
    var lat: String
}
