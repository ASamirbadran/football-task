//
//  Winner.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct Winner : Mappable {
	var id : Int?
	var name : String?
	var shortName : String?
	var tla : String?
	var crestUrl : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		name <- map["name"]
		shortName <- map["shortName"]
		tla <- map["tla"]
		crestUrl <- map["crestUrl"]
	}

}
