//
//  CurrentSeason.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct CurrentSeason : Mappable {
    var id : Int?
    var startDate : String?
    var endDate : String?
    var currentMatchday : Int?
    var winner : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        startDate <- map["startDate"]
        endDate <- map["endDate"]
        currentMatchday <- map["currentMatchday"]
        winner <- map["winner"]
    }
    
}
