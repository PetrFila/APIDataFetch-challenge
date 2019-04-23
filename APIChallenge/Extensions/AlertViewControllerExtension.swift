//
//  Alert.swift
//  APIChallenge
//
//  Created by Petr Fila on 17/4/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import Foundation
import UIKit
// Can't make it work on the IndexViewController
extension UIViewController {
    func sessionError(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        present(alert, animated: true)
    }
}
