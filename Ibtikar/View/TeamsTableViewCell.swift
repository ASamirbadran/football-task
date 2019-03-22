//
//  TeamsTableViewCell.swift
//  Ibtikar
//
//  Created by Samir on 3/22/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var TeamFoundedIn: UILabel!
    @IBOutlet weak var TeamName: UILabel!
    @IBOutlet weak var TeamFlag: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.darkGray
    }

    //
    func decorate(for teamCell : Teams?, in controller: TeamsTableViewController) {
        //let _TeamFlag =  teamCell?.crestUrl
        let _TeamName = teamCell?.name ?? ""
        let _TeamFoundedIn = teamCell?.founded ?? 0000
      
        //self.TeamFlag.text = _TeamFlag
        self.TeamName.text = _TeamName
        self.TeamFoundedIn.text = "Founded In  \(String(describing: _TeamFoundedIn))"
        
        
        
    }

}
