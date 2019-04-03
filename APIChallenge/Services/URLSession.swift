//
//  URLSession.swift
//  APIChallenge
//
//  Created by Petr Fila on 6/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit


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
            
<<<<<<< HEAD
            if let content = data {
                // copy line 61 onwards
            } else {
                return
            }
            
            // serialise the data into array of any type
            //    guard let json = (try? JSONSerialization.jsonObject(with:content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [AnyObject] else {
            //        print("Not containing JSON")
            //        return
            //    }
            //
            //    print("json response dictionary is \n \(json)")
            
            
=======
>>>>>>> f00d4f6048fb0b8a4b51d21c153f18ad1abcc372
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
            
<<<<<<< HEAD
            completion((first_name_array, last_name_array, email_array))
            
            }.resume()
    }
}
=======
            

            }.resume()

 
//}
>>>>>>> f00d4f6048fb0b8a4b51d21c153f18ad1abcc372







  

