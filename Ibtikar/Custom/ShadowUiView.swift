//
//  ShadowUiView.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit
extension UIView {
    func UiViewShadow() {
        self.layer.shadowColor = UIColor.black.cgColor

        
        //self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 18
        self.layer.shadowOpacity = 1

    }
    
}
