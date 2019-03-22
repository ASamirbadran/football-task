//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

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


