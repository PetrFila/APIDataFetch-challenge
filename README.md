# APIDataFetch-challenge
### iOS fetch data from an API challenge
![iOS_API_Challenge](https://user-images.githubusercontent.com/24504108/56087965-b0390b80-5eb9-11e9-876e-5410780566de.png)

### Steps in what this project was created
* created service file for API call using URLSession
* created tableViewController and populated the data in to the cells
* created second screen to display data details
* created segment control
* set up sorting for the data and assigned to the segment buttons
* apply the segment set ups to the cells and detail screen

### Issues and solutions
* How to access another property of a class in another property that need to be instantiated.<br/>  -> Use lazy var
* What's the best way to create a service method.<br/>  -> Use a class
* How to pass data from service request to other objects (eg. UIViewController).<br/>  -> Use completion handlers
* No data displayed on the screen but fetched and loaded in the model.  
The table cells get processed before the data gets populated so the cells need to be reloaded.  
Needed to uset following piece of code to reload the cells.

```
DispatchQueue.main.async {
    self.tableView.reloadData()                
}
```

* Displaying segment sontrol and table view in one screen.<br/>  -> Need UIViewController and inherit UITableViewDataSource and UITableViewDelegate on top of ViewController class
