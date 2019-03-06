//
//  URLSession.swift
//  APIChallenge
//
//  Created by Petr Fila on 6/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit



let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)


let url = URL(string: "https://gist.githubusercontent.com/douughios/f3c382f543a303984c72abfc1d930af8/raw/5e6745333061fa010c64753dc7a80b3354ae324e/test-users.json")!



let task = session.dataTask(with: url) {
    data, response, error in
    
    //checking for errors
    guard error == nil else {
        print("error: \(error!)")
        return
    }
    
    // check for data being returned
    guard let content = data else {
        
        print("No data")
        return
    }
    
    // serialise the data into array of any type
    //    guard let json = (try? JSONSerialization.jsonObject(with:content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [AnyObject] else {
    //        print("Not containing JSON")
    //        return
    //    }
    //
    //    print("json response dictionary is \n \(json)")
    
    
    guard let jsonToModel = (try? JSONDecoder().decode([OurModel].self, from: content)) else {
        print("Not containing JSON")
        return
    }
    
    //    print(jsonToModel)
    var first_name_array = [String]()
    var last_name_array = [String]()
    var email_array = [String]()
    
    for i in jsonToModel {
        if let first_name = i.first_name {
            first_name_array.append(first_name)
        }
        if let last_name = i.last_name {
            last_name_array.append(last_name)
        }
        if let email = i.email {
            email_array.append(email)
        }
    }
  
    print(first_name_array)
    print(last_name_array)
    print(email_array)
    
    
}.resume()
