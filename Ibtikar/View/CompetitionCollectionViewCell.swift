//
//  CompetitionCollectionViewCell.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit

class CompetitionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var compLocation: UILabel!
    @IBOutlet weak var compName: UILabel!
    @IBOutlet weak var compStrDate: UILabel!
    @IBOutlet weak var CompEndDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.UiCollectionViewShadow()
        self.backgroundColor = UIColor.black
        
    }
    
    override var bounds: CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11.0, *) {
            self.dateView.clipsToBounds = true
            self.dateView.layer.cornerRadius = 10
            self.dateView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.dateView.frame
            rectShape.position = self.dateView.center
            rectShape.path = UIBezierPath(roundedRect: self.dateView.bounds,    byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
            self.dateView.layer.mask = rectShape
            
        }
        
    }

    
    
    //
    func decorate(for compCell : Competitions?, in controller: CompetitionsCollectionViewController) {
        let name =  compCell?.name ?? ""
        let location = compCell?.area?.name ?? ""
        let startDate = compCell?.currentSeason?.startDate ?? ""
        let endDate = compCell?.currentSeason?.endDate ?? ""
        
     
        
        self.compName.text = name
        self.compStrDate.text = CusDateFormat.ChangeDateFormat(date: startDate)
        self.CompEndDate.text = CusDateFormat.ChangeDateFormat(date: endDate)
        self.compLocation.text = location
        

    }
    
    
    
}

    
 

