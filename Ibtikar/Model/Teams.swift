//
//  Teams.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

struct Teams : Mappable {
	var id : Int?
	var area : Area?
	var name : String?
	var shortName : String?
	var tla : String?
	var crestUrl : String?
	var address : String?
	var phone : String?
	var website : String?
	var email : String?
	var founded : Int?
	var clubColors : String?
	var venue : String?
	var lastUpdated : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

		id <- map["id"]
		area <- map["area"]
		name <- map["name"]
		shortName <- map["shortName"]
		tla <- map["tla"]
		crestUrl <- map["crestUrl"]
		address <- map["address"]
		phone <- map["phone"]
		website <- map["website"]
		email <- map["email"]
		founded <- map["founded"]
		clubColors <- map["clubColors"]
		venue <- map["venue"]
		lastUpdated <- map["lastUpdated"]
	}

}
