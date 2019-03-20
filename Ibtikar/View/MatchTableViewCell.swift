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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.contentView.backgroundColor = UIColor.white

    }
    
  
    
    

  

}
