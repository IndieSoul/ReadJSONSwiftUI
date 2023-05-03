//
//  Model2.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 03/05/23.
//

import Foundation


struct Model2: Codable {
    var data: [UserList]
}

struct UserList: Codable {
    var id: Int
    var first_name: String
    var email: String
    var avatar: String
}
