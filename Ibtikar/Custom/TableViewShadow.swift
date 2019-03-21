//
//  TableViewShadow.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import UIKit
class TableViewShadow: UIView  {
    override func awakeFromNib() {
        self.layer.shadowColor = UIColor.white.cgColor
        //self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.3
        self.layer.cornerRadius = 10
    }
}
