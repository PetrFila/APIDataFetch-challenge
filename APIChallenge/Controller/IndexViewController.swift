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
        sc.tintColor = UIColor.black
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChanges), for: .valueChanged)
       return sc
    }()
    
    
    
    lazy var tableView: UITableView = {
        var table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(mainSegment)
        
        constraints()

        
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
    
    //MARK: - Segment
    
    @ objc fileprivate func handleSegmentChanges() {
        if mainSegment.selectedSegmentIndex == 0 {
            view.backgroundColor = UIColor.red
        }
        else if mainSegment.selectedSegmentIndex == 1 {
            view.backgroundColor = UIColor.yellow
        }
        else {
            view.backgroundColor = UIColor.cyan
        }
    }
    
    
    // MARK: - Table view data source
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // checking and returning the lenght of the data array to get the right amount of cells created
        return dataInArray.count
        
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! IndexTableViewCell
        
        //Configure the cell...
        
        let ourModelAtRow = dataInArray[indexPath.row]
        cell.firstName = ourModelAtRow.first_name  // dataInArray[1]
        cell.lastName = ourModelAtRow.last_name
        cell.email = ourModelAtRow.email
        cell.navImageCell = navImage
        cell.layoutSubviews()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // this recognises what the user taps on by getting the number of cell index from the table view array
        let detailIndex = dataInArray[indexPath.row]
        let detailScreen = Details()
        detailScreen.detailFirstName = detailIndex.first_name
        detailScreen.detailLastName = detailIndex.last_name
        detailScreen.detailEmail = detailIndex.email
        detailScreen.detailID = detailIndex.id
//        self.present(detailScreen, animated: true, completion: nil)
        self.navigationController?.pushViewController(detailScreen, animated: true)

    }
    
    @objc func moveToDetailScreen() {
        show(Details(), sender: self)
    }
    
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
    }

}
