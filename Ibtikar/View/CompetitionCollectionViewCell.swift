//
//  CompetitionCollectionViewCell.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit

class CompetitionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var compLocation: UILabel!
    @IBOutlet weak var compName: UILabel!
    @IBOutlet weak var compStrDate: UILabel!
    @IBOutlet weak var CompEndDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.UiCollectionViewShadow()
        self.backgroundColor = UIColor.white


    }
    //
    func decorate(for compCell : Competitions?, in controller: CompetitionsCollectionViewController) {
        let name =  compCell?.name ?? ""
        let location = compCell?.area?.name ?? ""
        let startDate = compCell?.currentSeason?.startDate ?? ""
        let endDate = compCell?.currentSeason?.endDate ?? ""
        
        
        
        self.compName.text = name
        self.compStrDate.text = startDate
        self.CompEndDate.text = endDate
        self.compLocation.text = location
        

    }
    
    
}

    
 
