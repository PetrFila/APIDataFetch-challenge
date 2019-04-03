//
//  indexTableViewCell.swift
//  APIChallenge
//
//  Created by Petr Fila on 5/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class IndexTableViewCell: UITableViewCell {
    
    var firstName: String?
    var lastName: String?
    var email: String?
    
    lazy var firstNameView: UITextView = {
        var textView = UITextView()
//        textView.font = UIFont.systemFont(ofSize: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
//        textView.backgroundColor = UIColor.yellow
        return textView
    }()
    
    lazy var lastNameView: UITextView = {
        var textView = UITextView()
//        textView.font = UIFont.systemFont(ofSize: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
//        textView.backgroundColor = UIColor.red
        return textView
    }()
    
    lazy var emailView: UITextView = {
        var textView = UITextView()
//        textView.font = UIFont.systemFont(ofSize: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
//        textView.backgroundColor = UIColor.blue
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(firstNameView)
        self.addSubview(lastNameView)
        self.addSubview(emailView)
        
        firstNameView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        firstNameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        firstNameView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        lastNameView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        lastNameView.topAnchor.constraint(equalTo: self.firstNameView.bottomAnchor).isActive = true
        lastNameView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        
        emailView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        emailView.topAnchor.constraint(equalTo: self.lastNameView.bottomAnchor).isActive = true
        emailView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        emailView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        if let firstName = firstName {
            firstNameView.text = firstName
        }

        if let lastName = lastName {
            lastNameView.text = lastName
        }

        if let email = email {
            emailView.text = email
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
