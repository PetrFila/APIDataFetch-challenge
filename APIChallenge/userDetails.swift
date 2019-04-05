//
//  userDetails.swift
//  APIChallenge
//
//  Created by Petr Fila on 4/4/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import Foundation
import UIKit

class Details: UIViewController {
    
    var detailFirstName: String?
    var detailLastName: String?
    var detailEmail: String?
    
    lazy var firstNameDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
//                textView.backgroundColor = UIColor.yellow
        return textView
    }()
    
    lazy var lastNameDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        //        textView.backgroundColor = UIColor.red
        return textView
    }()
    
    lazy var emailDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        //        textView.backgroundColor = UIColor.blue
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
//        view.backgroundColor = UIColor.white
        view.addSubview(firstNameDetails)
        viewDatadetails()
        constraints()
    }
    
    func viewDatadetails() {
        if let detailFirstName = detailFirstName {
            firstNameDetails.text = detailFirstName
        }
        
        if let detailLastName = detailLastName {
            lastNameDetails.text = detailLastName
        }
        
        if let detailEmail = detailEmail {
            emailDetails.text = detailEmail
        }
    }
    
    func constraints() {
        firstNameDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    
 
    
    
}
