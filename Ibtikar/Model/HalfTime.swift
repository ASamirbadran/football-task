//
//  HalfTime.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

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
