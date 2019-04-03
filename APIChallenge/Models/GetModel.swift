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
    var first_name: String?
    var last_name: String?
    var email: String?
}
