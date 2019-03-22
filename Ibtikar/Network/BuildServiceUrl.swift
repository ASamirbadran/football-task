//
//  BuildServiceUrl.swift
//  AndalusiaEgyptBooking
//
//  Created by Ahmed Samir AbdElMaaboud on 4/16/18.
//  Copyright © 2018 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
class BuildServiceUrl{
    
    class func buildMatchesUrl(competitionId: Int ,season: String)->String{
        
        return "\(competitionUrl)\(competitionId)/matches?season=\(season)"
    }
    
    //teams for specific compition (latest season)
    class func buildTeamsUrl(competitionId: Int ,season: String)->String{
        return "\(competitionUrl)\(competitionId)/teams?season=\(season)"
    }
    
    
   
    
}
