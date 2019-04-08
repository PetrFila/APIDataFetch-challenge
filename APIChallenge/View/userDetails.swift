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
    
    
    lazy var topContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        view.backgroundColor = UIColor.lightGray

        return view
    }()
    
    lazy var firstNameDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
                textView.backgroundColor = UIColor.yellow
        return textView
    }()
    
    lazy var lastNameDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        //        textView.backgroundColor = UIColor.red
        return textView
    }()
    
    lazy var bottomContainerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        view.backgroundColor = UIColor.cyan
        
        return view
    }()
    
    lazy var emailDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
                textView.backgroundColor = UIColor.red
        return textView
    }()
    
    lazy var IdDetails: UILabel = {
        var textView = UILabel()
        textView.translatesAutoresizingMaskIntoConstraints = false
        //        textView.backgroundColor = UIColor.blue
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        view.addSubview(topContainerView)
        topContainerView.addSubview(firstNameDetails)
        topContainerView.addSubview(lastNameDetails)
        
        view.addSubview(bottomContainerView)
        bottomContainerView.addSubview(emailDetails)
        bottomContainerView.addSubview(IdDetails)
        
        viewDataDetails()
        constraints()
    }
    
    func viewDataDetails() {
        if let detailFirstName = detailFirstName {
            firstNameDetails.text = detailFirstName
        }
        
        if let detailLastName = detailLastName {
            lastNameDetails.text = detailLastName
        }
        
        if let detailEmail = detailEmail {
            emailDetails.text = detailEmail
        }
        
        if let detailID = detailID {
            IdDetails.text = String(detailID)
        }
    }
    
    func constraints() {

        topContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        topContainerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        topContainerView.widthAnchor.constraint(equalToConstant:300).isActive = true

        firstNameDetails.leftAnchor.constraint(equalTo: topContainerView.leftAnchor, constant: 10).isActive = true
//        firstNameDetails.rightAnchor.constraint(equalTo: lastNameDetails.leftAnchor, constant: -5).isActive = true
       
        
        lastNameDetails.leftAnchor.constraint(equalTo: firstNameDetails.rightAnchor, constant: 5).isActive = true
//        lastNameDetails.rightAnchor.constraint(equalTo: topContainerView.rightAnchor, constant: -10).isActive = true

        
        
        bottomContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 400).isActive = true
        bottomContainerView.heightAnchor.constraint(equalToConstant:60).isActive = true
        bottomContainerView.widthAnchor.constraint(equalToConstant:300).isActive = true
        
        
        emailDetails.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 5).isActive = true
        emailDetails.leftAnchor.constraint(equalTo: bottomContainerView.leftAnchor, constant: 10).isActive = true
        
        
        IdDetails.topAnchor.constraint(equalTo: emailDetails.bottomAnchor, constant: 5).isActive = true
        IdDetails.leftAnchor.constraint(equalTo: bottomContainerView.leftAnchor, constant: 10).isActive = true

    }
    
    @objc func moveToIndexScreen() {
        show(IndexTableViewController(), sender: self)
    }
    
    
}
