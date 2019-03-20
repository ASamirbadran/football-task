//
//  RoundedImage.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit


class RoundedImage: UIImageView
    
{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}
