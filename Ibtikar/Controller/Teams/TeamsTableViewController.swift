//
//  TeamsTableViewController.swift
//  Ibtikar
//
//  Created by Samir on 3/21/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {
    @IBOutlet var TeamsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamsTableView.rowHeight = 170
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath)
        return cell
    }

   

}
