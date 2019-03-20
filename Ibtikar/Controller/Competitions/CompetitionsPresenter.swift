//
//  CompetitionsPresenter.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
protocol CompetitionsView: NSObjectProtocol {
 
}


class CompetitionsPresenter {
    fileprivate let competitionsService:CompetitionsService
    weak fileprivate var competitionsview : CompetitionsView?
    
    
    init(_competitionsService:CompetitionsService){
        self.competitionsService = _competitionsService
    }
    
    func attachView(_ view:CompetitionsView){
        competitionsview = view
    }
    
    func detachView() {
        competitionsview = nil
    }
    
        

}
