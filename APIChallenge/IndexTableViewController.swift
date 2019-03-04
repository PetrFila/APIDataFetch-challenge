//
//  IndexTableViewController.swift
//  APIChallenge
//
//  Created by Petr Fila on 4/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

struct OurModel: Decodable {
    var id: Int?
    var first_name: String?
    var last_name: String?
    var email: String?
}


class IndexTableViewController: UITableViewController {
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            
            guard let jsonToModel = (try? JSONDecoder().decode([OurModel].self, from: content)) else {
                print("Not containing JSON")
                return
            }
            
            print(jsonToModel[0])
        }
            task.resume()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    
}
