//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Create a property planet of type Planet!. This will store the planet whose facts are displayed in this table.
    var planet: Planet?
    
    @IBOutlet weak var factTableView: UITableView!
   
    
    // First, add a constant String called factCellIdentifier. This is the reuse identifier for the cells managed by this table view controller, so it will be used to dequeue a reusable cell for this table. Assign to this variable the string "FactCell".
    var factCellIdentifier: String = "FactCell"
    
    
    // Override viewDidLoad() to change the title of the table view to the name of the planet stored in the planet property. This title will be displayed in the nav bar. Don't forget to call super.viewDidLoad(), too!
    override func viewDidLoad() {
        factTableView.delegate = self
        factTableView.dataSource = self
    }
    
    // Override numberOfSections(in:) to return the number of sections in this table view (just one).
    // Implement numberOfSections(in:). There is only one section in this table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Implement tableView(_:numberOfRowsInSection:). The number of rows is equal to the number of planets tracked by this class.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection  (planet?.fact.count)")
        if let planet = planet {
            print(planet.fact.count)
            return planet.fact.count
        }
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier, for: indexPath) as! FactTableViewCell
        //cell.textLabel?.text = "Hello"
        if let planet = planet {
            let itemTitle = planet.fact[indexPath.row]
            cell.factTextView?.text = itemTitle // its ok to force unwrap a UI element
            // the property of the cell is the name of the IBOutlet to the custom field.
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
