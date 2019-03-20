//
//  SplashService.swift
//  Ibtikar
//
//  Created by Samir on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SplashService {
    var errorInresponse = false
    var emptyInresponse = false
    var compData : CompetitionsList?
    func  DownloadCompListData(completed : @escaping DownloadComplete){
        
      let headers    = [ "X-Auth-Token" : Token ]

        Alamofire.request("\(BaseUrl)competitions/", headers: headers).responseObject { (response: DataResponse<CompetitionsList>) in
            
            switch (response.result){
            case .failure(let error):
                self.errorInresponse = true
                print(error)
            case .success( _):
                self.errorInresponse = false
                let CompResponse = response.result.value
                self.compData = CompResponse
                if(self.compData?.competitions?.count == 0){
                    self.emptyInresponse = true
                }
            }
            

            completed()

        }
        
        
    }
}




