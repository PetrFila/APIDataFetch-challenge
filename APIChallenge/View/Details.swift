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
    var detailID: Int?
    
    lazy var nameDetailView: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
        return textView
    }()
    
    lazy var emailDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
        return textView
    }()
    
    lazy var idDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(nameDetailView)
        view.addSubview(emailDetails)
        view.addSubview(idDetails)
        viewDataDetails()
        constraints()
    }
    
    func viewDataDetails() {
        
        var nameDetailTuple: (String, String) = ("","")
        
        if let detailFirstName = detailFirstName {
            nameDetailTuple.0 = detailFirstName
        }
        
        if let detailLastName = detailLastName {
            nameDetailTuple.1 = detailLastName
        }
        
        nameDetailView.text = nameDetailTuple.0 + " " + nameDetailTuple.1
        if let detailEmail = detailEmail {
            emailDetails.text = detailEmail
        }
        
        if let detailID = detailID {
            idDetails.text = String(detailID)
        }
    }
    
    func constraints() {
        nameDetailView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        nameDetailView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        nameDetailView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true

        emailDetails.topAnchor.constraint(equalTo: nameDetailView.bottomAnchor, constant: 10).isActive = true
        emailDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        emailDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        
        idDetails.topAnchor.constraint(equalTo: emailDetails.bottomAnchor, constant: 10).isActive = true
        idDetails.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        idDetails.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 30).isActive = true
    }
    
    @objc func moveToIndexScreen() {
        show(IndexViewController(), sender: self)
    }
    
}
