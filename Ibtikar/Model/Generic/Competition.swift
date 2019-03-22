//
//  Competitions.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

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
