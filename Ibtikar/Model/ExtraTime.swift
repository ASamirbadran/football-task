//
//  ExtraTime.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

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
