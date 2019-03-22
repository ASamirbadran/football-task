//
//  Competitions.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct Competitions : Mappable {
    var id : Int?
    var area : Area?
    var name : String?
    var code : String?
    var emblemUrl : String?
    var plan : String?
    var currentSeason : CurrentSeason?
    var numberOfAvailableSeasons : Int?
    var lastUpdated : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        area <- map["area"]
        name <- map["name"]
        code <- map["code"]
        emblemUrl <- map["emblemUrl"]
        plan <- map["plan"]
        currentSeason <- map["currentSeason"]
        numberOfAvailableSeasons <- map["numberOfAvailableSeasons"]
        lastUpdated <- map["lastUpdated"]
    }
    
}
