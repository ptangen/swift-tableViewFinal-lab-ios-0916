//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var planetTableView1: UITableView!
    
    
    // Add a property called planetCellIdentifier. This is a String which will identify the type of cell you want to dequeue from the table view. Assign this the string "PlanetCell".
    var planetCellIdentifier: String = "PlanetCell"
    
    // You will also need to create a property called planets to store the facts for a list of planets. You already have a Planet class that will store the data, and a tablvariew will show multiple planets, so what should the type of this property be? (If you guessed [Planet], you're right!)
    var planets = [Planet]()
    
    // Next, you should create a method called generatePlanetInfo() that will fill in the planets property you just created. This method takes no parameters and returns no value (it sets the planets property directly). To keep this simple, you only need to generate facts for two planets, Earth and Mars. Here are the planets and their relevant facts.
    
    func generatePlanetInfo() {
        let earthFacts = ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."]
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, fact: earthFacts)
        planets.append(earth)
        
        let marsFacts = ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."]
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, fact: marsFacts)
        planets.append(mars)
    }
    
    
    // You will need to call generatePlanetInfo() to fill in the planets property. You can call this from an overriden viewDidLoad() method. Don't forget to call `super.viewDidLoad() first!
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    // Implement numberOfSections(in:). There is only one section in this table view.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Implement tableView(_:numberOfRowsInSection:). The number of rows is equal to the number of planets tracked by this class.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetTableViewCell", for: indexPath) as! PlanetTableViewCell

        cell.planetNameLabel.text = planets[indexPath.row].name
        cell.numberOfMoonsLabel.text = String(planets[indexPath.row].numberOfMoons)
        cell.numberOfDaysFullOrbitLabel.text = String(planets[indexPath.row].fullOrbit)
        cell.numberOfFactsLabel.text = String(planets[indexPath.row].fact.count) + " facts"
        
        return cell
    }
    
    
    //Implement prepare(for:sender:). This method first needs to get the destination view controller using segue.destinationViewController and cast it to a view controller of type FactTableViewController. It then needs to get the index path for the selected row, and grab the correct planet from the planets property. Finally, it should set the planet property of the destination view controller to the selected planet. (If you need help, take a look at the previous labs and lessons for hints on how to implement this method properly.)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlanetDetail" {
            let destinationViewController = segue.destination as! FactTableViewController
            let selectedIndex = self.planetTableView1.indexPathForSelectedRow?.row
            
            if let selectedIndex = selectedIndex {
                destinationViewController.planet = self.planets[selectedIndex]
            }
        }
    }
}
