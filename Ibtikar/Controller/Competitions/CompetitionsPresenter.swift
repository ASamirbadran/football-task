//
//  CompetitionsPresenter.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation
protocol CompetitionsView: NSObjectProtocol {
    func updateCompititonList(filteredList: [Competitions])
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
    
    //by removing unauthorized tocken Id
    func FilterList(OriginalCompList : [Competitions]?) {
        var removedArrayIndeces : [Int] = []
        if var Filteredcompetitions = OriginalCompList {
            let count = Filteredcompetitions.count
            for i in 0..<count {
                print(i)
                if let compId = Filteredcompetitions[i].id{
                    if(!allowedComIds.contains(compId)){
                        removedArrayIndeces.append(i)
                        print("removing \(compId)")
                    }
                }
                
            }
            Filteredcompetitions.remove(at: removedArrayIndeces)
            self.competitionsview?.updateCompititonList(filteredList: Filteredcompetitions)
        }
    }

}
