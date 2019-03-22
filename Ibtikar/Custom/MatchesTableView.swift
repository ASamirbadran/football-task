//
//  MatchesTableViewC.swift
//  Ibtikar
//
//  Created by Samir on 3/22/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import UIKit
class MatchesTableView: UIView  {
    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        //self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.setGradientBackground(colorTop: UIColor(red: 22/255, green: 22/255, blue: 22/255, alpha: 1), colorBottom: UIColor(red: 60/255, green: 42/255, blue: 21/255, alpha: 1))
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.9, y: 0.8)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = bounds
        gradientLayer.type = .radial
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}
