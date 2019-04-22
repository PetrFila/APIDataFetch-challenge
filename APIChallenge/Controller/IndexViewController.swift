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
    
    lazy var spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        spinner.style = UIActivityIndicatorView.Style.gray
        return spinner
    }()
    
    lazy var alertMessage : UILabel = {
        var message = UILabel()
        message.text = "Something went wrong \n Try again later"
        message.textAlignment = .center
        message.numberOfLines = 0
        return message
    }()
    
    lazy var mainSegment: UISegmentedControl = {
        var sc = UISegmentedControl(items: ["ID", "First Name", "Last Name"])
        sc.tintColor = UIColor.blue
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
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        spinner.startAnimating()
        alertMessage.isHidden = true
        tableView.isHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IndexTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        view.backgroundColor = UIColor.white
        view.addSubview(mainSegment)
        view.addSubview(tableView)
        view.addSubview(alertMessage)
        view.addSubview(spinner)
        
        autoresizing()
        constraints()
        
        // creating object from our URL Session service class
        let serviceClass = MyService()
        // using the object method to fetch data from API
        // using closure to pass the data to this controller
        serviceClass.fetchData { person, error  in
            
            // assigning the decoded data to external variable of type array
            if let error = error {
                print("Error message from index controller: ", error)
            }
            
            self.dataInArray = person ?? []

            // Dispatch view reloads the screen again after the data is fetched and appended to the arrays
            // The problem here is that the arrays get loaded to the screen before the data from the internet can be fetched and populated.
            DispatchQueue.main.async {
                if error != nil {
                   self.spinner.stopAnimating()
                   self.alertMessage.isHidden = false
                   self.tableView.isHidden = true
                   UIApplication.shared.endIgnoringInteractionEvents()
                } else {
                   self.spinner.stopAnimating()
                   self.tableView.isHidden = false
                   UIApplication.shared.endIgnoringInteractionEvents()
                }
                
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
    
    // this is called for every cell -> it's a loop
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // safe unwrap of the cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? IndexTableViewCell
            else { return UITableViewCell() }
        
        //Configure the cell...
        
        switch mainSegment.selectedSegmentIndex {
        case 0:
            // sorting was set up here -> bad practice as it is a loop inside of a loop
            let ourModelAtRow = dataInArray[indexPath.row]
            cell.firstName = ourModelAtRow.firstName  // dataInArray[1]
            cell.lastName = ourModelAtRow.lastName
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        case 1:
            let ourModelAtRow = dataInArray[indexPath.row]
            cell.firstName = ourModelAtRow.firstName  // dataInArray[1]
            cell.lastName = ourModelAtRow.lastName
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        case 2:
            let ourModelAtRow = dataInArray[indexPath.row]
            cell.firstName = ourModelAtRow.firstName  // dataInArray[1]
            cell.lastName = ourModelAtRow.lastName
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        default:
            let ourModelAtRow = dataInArray[indexPath.row]
            cell.firstName = ourModelAtRow.firstName  // dataInArray[1]
            cell.lastName = ourModelAtRow.lastName
            cell.email = ourModelAtRow.email
            cell.navImageCell = navImage
            cell.layoutSubviews()
        }
        
        return cell
    }
    
    // this function recognises what the user taps on by getting the number of cell index from the table view array

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailScreen = Details()
        
        switch mainSegment.selectedSegmentIndex {
        // sorting was set up here -> bad practice as it is a loop inside of a loop
        case 0:
            let detailIndex = dataInArray[indexPath.row]
            detailScreen.detailFirstName = detailIndex.firstName
            detailScreen.detailLastName = detailIndex.lastName
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
            
        case 1:
            let detailIndex = dataInArray[indexPath.row]
            detailScreen.detailFirstName = detailIndex.firstName
            detailScreen.detailLastName = detailIndex.lastName
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
        case 2:
            let detailIndex = dataInArray[indexPath.row]
            detailScreen.detailFirstName = detailIndex.firstName
            detailScreen.detailLastName = detailIndex.lastName
            detailScreen.detailEmail = detailIndex.email
            detailScreen.detailID = detailIndex.id
        default:
            let detailIndex = dataInArray[indexPath.row]
            detailScreen.detailFirstName = detailIndex.firstName
            detailScreen.detailLastName = detailIndex.lastName
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
        // sort your data set. This is used for both screens: Table view and Details view
        switch mainSegment.selectedSegmentIndex {
        case 0:
            dataInArray = dataInArray.sorted(by: {$0.id < $1.id})
        case 1:
            dataInArray = dataInArray.sorted(by: {
                let fName1 = $0.firstName ?? ""
                let fName2 = $1.firstName ?? ""
                
                return fName1 < fName2
            })
        case 2:
            dataInArray = dataInArray.sorted(by: {
                let lName1 = $0.lastName ?? ""
                let lName2 = $1.lastName ?? ""
                
                return lName1 < lName2
            })
        default:
            break
        }
        
        self.tableView.reloadData()
    }
    
    //MARK: - Constraints
    
    func autoresizing() {
        mainSegment.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        alertMessage.translatesAutoresizingMaskIntoConstraints = false
        spinner.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func constraints() {
        // this is a different way of writing constraints
        // no need to put .isActive after each and every constraint
        // the elements are separated in different arrays for better readability. They could be all in one array
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
        
        NSLayoutConstraint.activate([
            alertMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            alertMessage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
}
