//
//  URLSession.swift
//  APIChallenge
//
//  Created by Petr Fila on 6/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

/* 3 problems
 1. how to access another property of a class in another property that need to be instantiated -> use lazy var
 2. what's the best way to create a service method -> use a class
 3. how to pass data from service request to other objects (eg. UIViewController) -> use completion handlers
 */

/*
 using model for json decoded data to be passed to the Table View Controller
 */


class MyService {
    
    let config = URLSessionConfiguration.default
    
    lazy var session: URLSession = {
        URLSession(configuration: config)
    }()
    
    let url = URL(string: "https://gist.githubusercontent.com/douughios/f3c382f543a303984c72abfc1d930af8/raw/5e6745333061fa010c64753dc7a80b3354ae324e/test-users.json")!
    
    // endpoint with invalid JSON file for testing error handeling
    // let url = URL(string: "https://reqres.in//api/unknown/23")!
    
    func fetchData(completion: @escaping (_: [OurModel]?, Error?) -> Void) {
        _ = session.dataTask(with: url) {
            data, response, error in
            
            //checking for errors
            guard error == nil else {
                // passing the error variable to the Table View Controller
                completion(nil, error)
                return
            }

            // checking for data being returned
            guard let content = data else {
                print("No data")
                // passing the error variable to the Table View Controller
                completion(nil, error)
                return
            }

            do {
                let jsonToModel = try JSONDecoder().decode([OurModel].self, from: content)
                // passing the jsonToModel variable to the Table View Controller
                completion(jsonToModel, nil)

            } catch {
                // passing the error variable to the Table View Controller
                completion(nil, error)

            }

            }.resume()
    }
}
