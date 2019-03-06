//
//  IndexTableViewController.swift
//  APIChallenge
//
//  Created by Petr Fila on 4/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit



class IndexTableViewController: UITableViewController {
        
    let cellIdentifier = "Cell"
    
    var first_name_array = [String]()
    var last_name_array = [String]()
    var email_array = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.register(IndexTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        let session = task
        print(session)
        
//        for i in session {
//            if let first_name = i.first_name {
//                first_name_array.append(first_name)
//            }
//            if let last_name = i.last_name {
//                last_name_array.append(last_name)
//            }
//            if let email = i.email {
//                email_array.append(email)
//            }
//        }
    }
  

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(first_name_array)
        return first_name_array.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

         //Configure the cell...
        
        cell.textLabel?.text = first_name_array[indexPath.row]
        print(cell)

        return cell
    }
 

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
