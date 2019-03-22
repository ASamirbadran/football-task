//
//  MatchList.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct MatchList : Mappable {
	var count : Int?
	var filters : Filters?
	var competition : Competition?
	var matches : [Matches]?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		count <- map["count"]
		filters <- map["filters"]
		competition <- map["competition"]
		matches <- map["matches"]
	}

}


