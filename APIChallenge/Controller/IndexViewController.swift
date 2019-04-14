//
//  IndexViewController.swift
//  APIChallenge
//
//  Created by Petr Fila on 4/3/19.
//  Copyright © 2019 Petr Fila. All rights reserved.
//

import UIKit

class IndexViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "Cell"
    // empty array for our future data
    var dataInArray = [OurModel]()
    // arrow image in the cell
    var navImage = UIImage(named: "icons8-back-96")

    
    lazy var mainSegment: UISegmentedControl = {
       var sc = UISegmentedControl(items: ["ID", "First Name", "Last Name"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.blue
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChanges), for: .valueChanged)
       return sc
    }()
    
    
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false

        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IndexTableViewCell.self, forCellReuseIdentifier: cellIdentifier)

        
        view.backgroundColor = UIColor.white
        view.addSubview(mainSegment)
        view.addSubview(tableView)
        
        constraints()

        
        
        // creating object from our URL Session service class
        let serviceClass = MyService()
        // using the object method to fetch data from API
        // using closure to pass the data to this controller
        serviceClass.fetchData { person in
            
            
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // checking and returning the lenght of the data array to get the right amount of cells created
        return dataInArray.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! IndexTableViewCell
        
        //Configure the cell...

        switch mainSegment.selectedSegmentIndex {
        case 0:
            let ourModelAtRow = dataInArray.sorted(by: {$0.id! < $1.id!})[indexPath.row]
            cell.firstName = ourModelAtRow.first_name  // dataInArray[1]
            cell.lastName = ourModelAtRow.last_name
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        case 1:
            let ourModelAtRow = dataInArray.sorted(by: {$0.first_name! < $1.first_name!})[indexPath.row]
            cell.firstName = ourModelAtRow.first_name  // dataInArray[1]
            cell.lastName = ourModelAtRow.last_name
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        case 2:
            let ourModelAtRow = dataInArray.sorted(by: {$0.last_name! < $1.last_name!})[indexPath.row]
            cell.firstName = ourModelAtRow.first_name  // dataInArray[1]
            cell.lastName = ourModelAtRow.last_name
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        default:
            let ourModelAtRow = dataInArray.sorted(by: {$0.id! < $1.id!})[indexPath.row]
            cell.firstName = ourModelAtRow.first_name  // dataInArray[1]
            cell.lastName = ourModelAtRow.last_name
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this recognises what the user taps on by getting the number of cell index from the table view array

        let detailScreen = Details()
      
        switch mainSegment.selectedSegmentIndex {
        case 0:
            let detailIndex = dataInArray.sorted(by: {$0.id! < $1.id!})[indexPath.row]
            detailScreen.detailFirstName = detailIndex.first_name
            detailScreen.detailLastName = detailIndex.last_name
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
           
        case 1:
            let detailIndex = dataInArray.sorted(by: {$0.first_name! < $1.first_name!})[indexPath.row]
            detailScreen.detailFirstName = detailIndex.first_name
            detailScreen.detailLastName = detailIndex.last_name
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
        case 2:
            let detailIndex = dataInArray.sorted(by: {$0.last_name! < $1.last_name!})[indexPath.row]
            detailScreen.detailFirstName = detailIndex.first_name
            detailScreen.detailLastName = detailIndex.last_name
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
        default:
            let detailIndex = dataInArray.sorted(by: {$0.id! < $1.id!})[indexPath.row]
            detailScreen.detailFirstName = detailIndex.first_name
            detailScreen.detailLastName = detailIndex.last_name
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
            
        }
        
        
        self.navigationController?.pushViewController(detailScreen, animated: true)

 
    }
    
    @objc func moveToDetailScreen() {
        show(Details(), sender: self)
    }
    
    //MARK: - Segment
    
    @ objc func handleSegmentChanges() {
        self.tableView.reloadData()
    }
    
    //MARK: - Constraints
    
    func constraints() {
        // this is a different way of writing constraints
        // no need to put .isActive after each and every constraint
        NSLayoutConstraint.activate([
        mainSegment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainSegment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        mainSegment.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
        mainSegment.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
        mainSegment.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        tableView.topAnchor.constraint(equalTo: mainSegment.bottomAnchor, constant: 20),
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
