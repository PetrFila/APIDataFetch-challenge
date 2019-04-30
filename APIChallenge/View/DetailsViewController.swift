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
    
    //we are re-using the model again to receive data details from the indexViewController
    // this variable's type is assigned to the model to match the incoming data type object
    var modelToDisplay: UserModel?
    
    lazy var nameDetailView: UILabel = {
        var textView = UILabel()
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
        return textView
    }()
    
    lazy var emailDetails: UILabel = {
        var textView = UILabel()
        textView.lineBreakMode = .byWordWrapping
        textView.numberOfLines = 0
        return textView
    }()
    
    lazy var idDetails: UILabel = {
        var textView = UILabel()
        return textView
    }()
    
    lazy var stackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameDetailView, emailDetails, idDetails])
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.spacing = 10
        stackView.distribution = UIStackView.Distribution.fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        view.addSubview(nameDetailView)
        view.addSubview(emailDetails)
        view.addSubview(idDetails)
        view.addSubview(stackView)
        
        viewDataDetails()
        translateAutoresizingConstraints()
        setConstraints()
    }
    
    func viewDataDetails() {
        
        var nameDetailTuple: (String, String) = ("","")
        
        if let detailFirstName = modelToDisplay?.firstName {
            nameDetailTuple.0 = detailFirstName
        }
        
        if let detailLastName = modelToDisplay?.lastName {
            nameDetailTuple.1 = detailLastName
        }
        
        nameDetailView.text = nameDetailTuple.0 + " " + nameDetailTuple.1
        
        if let detailEmail = modelToDisplay?.email {
            emailDetails.text = detailEmail
        }
        
        if let detailID = modelToDisplay?.id {
            idDetails.text = String(detailID)
        }
    }
    
    func translateAutoresizingConstraints() {
        view.translateAutoresizingConstraintsToElements(view: nameDetailView)
        view.translateAutoresizingConstraintsToElements(view: emailDetails)
        view.translateAutoresizingConstraintsToElements(view: idDetails)
        view.translateAutoresizingConstraintsToElements(view: stackView)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
            ])
    }
    
    @objc func moveToIndexScreen() {
        show(IndexViewController(), sender: self)
    }
    
}
