//
//  NavigationBar.swift
//  Ibtikar
//
//  Created by Samir on 3/21/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import UIKit
extension UICollectionViewController  {
       
    func addSearchBar() {
        let sc = UISearchController(searchResultsController: nil)
        //sc.delegate = self
        let scb = sc.searchBar
        scb.tintColor = UIColor.white
        scb.barTintColor = UIColor.white
        if #available(iOS 11.0, *) {
            if let textfield = scb.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.white
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            navigationItem.searchController = sc
            navigationItem.hidesSearchBarWhenScrolling = true
        }else{
            navigationItem.titleView = scb
        }
    }
    
    
}
