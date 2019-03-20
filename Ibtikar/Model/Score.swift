//
//  Score.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import ObjectMapper

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
