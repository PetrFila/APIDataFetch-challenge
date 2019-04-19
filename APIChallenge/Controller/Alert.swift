//
//  Alert.swift
//  APIChallenge
//
//  Created by Petr Fila on 17/4/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import Foundation
import UIKit

class Alert: UIViewController {
    static func sessionError(on vc: IndexViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true)
    }
}
