//
//  Matches.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct AwayTeam : Mappable {
    var id : Int?
    var name : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
    }
    
}

struct Competition : Mappable {
    var id : Int?
    var area : Area?
    var name : String?
    var code : String?
    var plan : String?
    var lastUpdated : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        area <- map["area"]
        name <- map["name"]
        code <- map["code"]
        plan <- map["plan"]
        lastUpdated <- map["lastUpdated"]
    }
    
}

struct ExtraTime : Mappable {
    var homeTeam : String?
    var awayTeam : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
    }
    
}
struct Filters : Mappable {
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
    }
    
}
struct FullTime : Mappable {
    var homeTeam : Int?
    var awayTeam : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
    }
    
}

struct HalfTime : Mappable {
    var homeTeam : Int?
    var awayTeam : Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
    }
    
}
struct HomeTeam : Mappable {
    var id : Int?
    var name : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
    }
    
}
struct Matches : Mappable {
    var id : Int?
    var season : Season?
    var utcDate : String?
    var status : String?
    var matchday : Int?
    var stage : String?
    var group : String?
    var lastUpdated : String?
    var score : Score?
    var homeTeam : HomeTeam?
    var awayTeam : AwayTeam?
    var referees : [Referees]?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        season <- map["season"]
        utcDate <- map["utcDate"]
        status <- map["status"]
        matchday <- map["matchday"]
        stage <- map["stage"]
        group <- map["group"]
        lastUpdated <- map["lastUpdated"]
        score <- map["score"]
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
        referees <- map["referees"]
    }
    
}
struct Penalties : Mappable {
    var homeTeam : String?
    var awayTeam : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        homeTeam <- map["homeTeam"]
        awayTeam <- map["awayTeam"]
    }
    
}
struct Referees : Mappable {
    var id : Int?
    var name : String?
    var nationality : String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        nationality <- map["nationality"]
    }
    
}
struct Score : Mappable {
    var winner : String?
    var duration : String?
    var fullTime : FullTime?
    var halfTime : HalfTime?
    var extraTime : ExtraTime?
    var penalties : Penalties?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        winner <- map["winner"]
        duration <- map["duration"]
        fullTime <- map["fullTime"]
        halfTime <- map["halfTime"]
        extraTime <- map["extraTime"]
        penalties <- map["penalties"]
    }
    
}
