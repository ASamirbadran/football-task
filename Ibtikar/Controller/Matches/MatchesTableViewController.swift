//
//  MatchesTableViewController.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MatchesTableViewController: UITableViewController {
    @IBOutlet var MatchTableView: UITableView!
    fileprivate let MatchPresenter = MatchesScreenPresenter(_matchesScreenService: MatchesScreenService())
    var downloadedMatchCVData : MatchList?
    var activityIndicatorView: UIActivityIndicatorView!
    
    var competitionId : Int!
    var latestSeasonByYear : String!
    var compitionName  = "Matches"
    override func viewDidLoad() {
        super.viewDidLoad()
        MatchTableView.delegate = self
        MatchTableView.dataSource = self
        MatchTableView.rowHeight = 170
        if UIDevice.current.userInterfaceIdiom == .pad {
            MatchTableView.rowHeight = 200
            
        }else{
            MatchTableView.rowHeight = 170
            
        }
        
        MatchPresenter.attachView(self)
        MatchPresenter.getMatchList(_compId: competitionId, _season: latestSeasonByYear)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "View Teams", style: .plain, target: self, action: #selector(TeamTabbed))

        
    }
    
    @objc func TeamTabbed() {
        self.performSegue(withIdentifier: "moveToTeamsVC", sender: nil)
        print(competitionId)

    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = "Matches for \(compitionName)"
        
    }
    
    override func loadView() {
        super.loadView()
        
        activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        
        tableView.backgroundView = activityIndicatorView
        tableView.backgroundColor = UIColor.darkGray
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return downloadedMatchCVData?.matches?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchCell", for: indexPath) as! MatchTableViewCell
        let row = indexPath.row
        let DesiredMatch = downloadedMatchCVData?.matches?[row]
        cell.decorate(for: DesiredMatch, in: self)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moveToTeamsVC") {
            if let CompTeam = segue.destination as? TeamsTableViewController {
                    CompTeam.competitionId = self.competitionId
                    CompTeam.latestSeasonByYear = self.latestSeasonByYear
                    CompTeam.compitionName = self.compitionName
                
                
            }
            
        }
        
    }
    
}





extension MatchesTableViewController : MatchesScreenView {
    func updateMatchTableData(matchData: MatchList?) {
        downloadedMatchCVData = matchData
        MatchTableView.reloadData()
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
