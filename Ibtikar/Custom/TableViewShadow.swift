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
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor(red: 0, green: 0/143, blue: 0/214, alpha: 1.0).cgColor
        self.layer.borderWidth = 0.1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 0.5
    }
}
