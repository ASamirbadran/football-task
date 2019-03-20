//
//  MatchesScreenService.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MatchesScreenService {
    var errorInresponse = false
    var emptyInresponse = false
    var MatchListData : MatchList?
    func  DownloadMatchListData(compId : Int , season : String ,completed : @escaping DownloadComplete){
        
        let Matchurl = BuildServiceUrl.buildMatchesUrl(competitionId: compId, season: season)
        let headers    = [ "X-Auth-Token" : Token ]
        
        Alamofire.request(Matchurl, headers: headers).responseObject { (response: DataResponse<MatchList>) in

            switch (response.result){

            case .failure(let error):
                self.errorInresponse = true
                print(error)
            case .success( _):
                self.errorInresponse = false
                let matchesResponse = response.result.value
                self.MatchListData = matchesResponse
                if(self.MatchListData?.matches?.count == 0){
                    self.emptyInresponse = true
                }
            }
            
            
            completed()
            
        }
        
        
    }
}




