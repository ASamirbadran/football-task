//
//  TeamsService.swift
//  Ibtikar
//
//  Created by Samir on 3/22/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class TeamsService {
    var errorInresponse = false
    var emptyInresponse = false
    var TeamsListData : TeamsList?
    func  DownloadTeamListData(compId : Int , season : String ,completed : @escaping DownloadComplete){
        
        let Teamsurl = BuildServiceUrl.buildTeamsUrl(competitionId: compId, season: season)
        let headers    = [ "X-Auth-Token" : Token ]
        print("Teamsurl : \(Teamsurl)")
        Alamofire.request(Teamsurl, headers: headers).responseObject { (response: DataResponse<TeamsList>) in

            switch (response.result){
            case .failure(let error):
                self.errorInresponse = true
                print(error)
            case .success( _):
                //print(response.result.value)
                self.errorInresponse = false
                let TeamsResponse = response.result.value
                self.TeamsListData = TeamsResponse
                //work around for unauthorized competition ids
                if(self.TeamsListData?.count == nil || self.TeamsListData?.count == 0){
                    self.emptyInresponse = true
                    print("empty")
                }
            }
        
            
            completed()
            
        }
        
        
    }
}




