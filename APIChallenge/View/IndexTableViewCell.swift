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
    var navImageCell = UIImage(named: "icons8-back-96")
    
    
    lazy var nameView: UILabel = {
       var text = UILabel()
       text.translatesAutoresizingMaskIntoConstraints = false
       text.lineBreakMode = .byWordWrapping
       text.numberOfLines = 0
       return text
    }()
    
    lazy var emailView: UILabel = {
        var textView = UILabel()
//        textView.font = UIFont.systemFont(ofSize: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = UIColor.cyan
        textView.isUserInteractionEnabled = false
        textView.numberOfLines = 0
        textView.lineBreakMode = .byWordWrapping
        
        return textView
    }()
    
    lazy var displayImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(nameView)
        self.addSubview(emailView)
        self.addSubview(displayImage)
        
        constraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var nameTuple: (String, String) = ("","")

        if let firstName = firstName {
            nameTuple.0 = firstName
        }

        if let lastName = lastName {
            nameTuple.1 = lastName
        }
        
        nameView.text = nameTuple.0 + " " + nameTuple.1

        if let email = email {
            emailView.text = email
        }
        
        if let navImageCell = navImageCell {
            displayImage.image = navImageCell
        }
        
    }
    
    func constraints() {
        // word wrapping works only for  single UILabel
        
        nameView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameView.bottomAnchor.constraint(equalTo: self.emailView.topAnchor).isActive = true
        nameView.rightAnchor.constraint(equalTo: self.displayImage.leftAnchor, constant: -100).isActive = true
        
        emailView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        emailView.topAnchor.constraint(equalTo: self.nameView.bottomAnchor).isActive = true
        emailView.rightAnchor.constraint(equalTo: self.displayImage.leftAnchor, constant: -100).isActive = true
        emailView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        
        displayImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        displayImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        displayImage.leftAnchor.constraint(equalTo: self.emailView.rightAnchor).isActive = true
        displayImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
        displayImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
