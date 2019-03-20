//
//  CompetitionsList.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct CompetitionsList : Mappable {
    var competitions : [Competitions]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        competitions <- map["competitions"]
    }
    
}
