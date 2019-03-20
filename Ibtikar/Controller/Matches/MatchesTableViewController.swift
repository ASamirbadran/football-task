//
//  MatchesTableViewController.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {
    @IBOutlet var MatchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MatchTableView.delegate = self
        MatchTableView.dataSource = self
        MatchTableView.rowHeight = 170
       
    }


    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchTableViewCell
        return cell
    }

   

   

}
