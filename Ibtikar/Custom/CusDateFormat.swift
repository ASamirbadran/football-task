//
//  DCusDateFormat.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
class CusDateFormat {
    class func ChangeDateFormat(date:String) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "YYYY-MM-dd"
            
            if formatter.date(from: date) != nil {
                let yourDate = formatter.date(from: date)
                formatter.dateFormat = "dd-MM-YYYY"
                let myStringafd = formatter.string(from: yourDate!)
                return myStringafd
            } else {
                return ""
            }
        }
    
     class func TrimDate(date:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        if formatter.date(from: date) != nil {
            let yourDate = formatter.date(from: date)
            formatter.dateFormat = "YYYY"
            let myStringafd = formatter.string(from: yourDate!)
            return myStringafd
        } else {
            return ""
        }
    }
    
}
