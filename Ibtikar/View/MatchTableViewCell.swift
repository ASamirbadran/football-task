//
//  MatchTableViewCell.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit

class MatchTableViewCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var FirstTeam: UILabel!
    @IBOutlet weak var MatchScore: UILabel!
    @IBOutlet weak var MatchStatus: UILabel!
    @IBOutlet weak var SecondTeam: UILabel!
    
    @IBOutlet weak var SecondTeamIcon: UILabel!
    @IBOutlet weak var FirstTeamIcon: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.darkGray

    }
    
  
    
    
    //
    func decorate(for matchCell : Matches?, in controller: MatchesTableViewController) {
        let _groupName =  matchCell?.group ?? ""
        let _FirstTeam = matchCell?.homeTeam?.name ?? ""
        let _MatchScoreFirstTeam = matchCell?.score?.fullTime?.homeTeam ?? 0
        let _MatchScoreSecondTeam = matchCell?.score?.fullTime?.awayTeam ?? 0
        let _SecondTeam = matchCell?.awayTeam?.name ?? ""
        let _MatchStatus = matchCell?.status ?? ""
        
        
        
        self.groupName.text = _groupName
        self.FirstTeam.text = _FirstTeam
        self.FirstTeamIcon.text = "\(String(_FirstTeam.prefix(1)))"
        self.MatchScore.text = "\(_MatchScoreFirstTeam) - \(_MatchScoreSecondTeam)"
        self.MatchStatus.text = _MatchStatus
        self.SecondTeam.text = _SecondTeam
        self.SecondTeamIcon.text = "\(String(_SecondTeam.prefix(1)))"

        
        
    }
    

  

}
