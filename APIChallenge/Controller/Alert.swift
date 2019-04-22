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
class Alert: UIViewController {
    func sessionError(vc: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: "Shit",
                                      message: "Something went wrong",
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        vc.present(alert, animated: true)
    }
}
