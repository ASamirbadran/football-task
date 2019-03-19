//
//  ShadowUicollectionCell.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit
extension UICollectionViewCell {
    func UiCollectionViewShadow() {
        
      
        self.clipsToBounds = false
        
        self.layer.shadowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.12).cgColor
        
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 8
        self.layer.borderColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.12).cgColor
        self.layer.borderWidth = 1

      
        
    }
    
    
   
}
