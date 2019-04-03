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
    // empty array for our future data
    var dataInArray = [OurModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(IndexTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        // creating object from our URL Session service class
        let serviceClass = MyService()
        // using the object method to fetch data from API
        // using closure to pass the data to this controller
        serviceClass.fetchData { person in
            
            
            print(person)
            // assigning the decoded data to external variable of type array
            self.dataInArray = person
            
            
            // Dispatch view reloads the screen again after the data is fetched and appended to the arrays
            // The problem here is that the arrays get loaded to the screen before the data from the internet can be fetched and populated.
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
                
            }
            
        }
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // checking and returning the lenght of the data array to get the right amount of cells created
        return dataInArray.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        //Configure the cell...
        
        let ourModelAtRow = dataInArray[indexPath.row]
        cell.textLabel?.text = ourModelAtRow.first_name  // dataInArray[1]
        cell.textLabel?.text = ourModelAtRow.last_name
        cell.textLabel?.text = ourModelAtRow.email
        return cell
    }
    
}
