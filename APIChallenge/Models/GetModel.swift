//
//  GetModel.swift
//  APIChallenge
//
//  Created by Petr Fila on 6/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

struct OurModel: Decodable {
    var id: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
    }
}
