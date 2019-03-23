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
    var competitionId : Int!
    var latestSeasonByYear : String!
    var compitionName  = "Teams"
    var activityIndicatorView: UIActivityIndicatorView!
    var downloadedTeamsCVData : TeamsList?

    fileprivate let teamsPresenter = TeamsPresenter(_teamsService: TeamsService())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TeamsTableView.delegate = self
        TeamsTableView.dataSource = self
        //detecting device Type 
        if UIDevice.current.userInterfaceIdiom == .pad {
            TeamsTableView.rowHeight = 150
            
        }else{
            TeamsTableView.rowHeight = 120
            
        }
        teamsPresenter.attachView(self)
        teamsPresenter.getTeamsList(_compId: competitionId, _season: latestSeasonByYear)
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = "Teams for \(compitionName)"
        
    }
    
    override func loadView() {
        super.loadView()
        
        activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        
        tableView.backgroundView = activityIndicatorView
        tableView.backgroundColor = UIColor.darkGray
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return downloadedTeamsCVData?.teams?.count ?? 0

    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamsTableViewCell
        let row = indexPath.row
        let DesiredTeam = downloadedTeamsCVData?.teams?[row]
        cell.decorate(for: DesiredTeam, in: self)
        return cell
        
    }

   

}


extension TeamsTableViewController : TeamsScreenView {
    func updateTeamsTableData(TeamData: TeamsList?) {
        downloadedTeamsCVData = TeamData
        TeamsTableView.reloadData()
    }
    
    func startLoading() {
        activityIndicatorView.startAnimating()
    }
    
    
    
    func stopLoading() {
        activityIndicatorView.stopAnimating()
    }
    
    func showAlert(_message: String) {
        ShowAlertUtility.DisplayAlert(title: "Error", message: _message, in: self)
        
    }
    
    func showRetryAlert(_message: String) {
        ShowAlertUtility.DisplayRetryAlert(title: "Error", message: _message, in: self)
        
    }
    
    
}
