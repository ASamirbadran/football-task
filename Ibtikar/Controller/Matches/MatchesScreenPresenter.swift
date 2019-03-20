//
//  MatchesScreenPresenter.swift
//  Ibtikar
//
//  Created by Samir on 3/20/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation

protocol MatchesScreenView: NSObjectProtocol {
    func updateMatchTableData(matchData : MatchList?)
    func startLoading()
    func showAlert(_message: String)
    func showRetryAlert(_message: String)
    func stopLoading()
}


class MatchesScreenPresenter {
    fileprivate let matchesScreenService:MatchesScreenService
    weak fileprivate var matchesScreenView : MatchesScreenView?
    
    
    init(_matchesScreenService:MatchesScreenService){
        self.matchesScreenService = _matchesScreenService
    }
    
    func attachView(_ view:MatchesScreenView){
        matchesScreenView = view
    }
    
    func detachView() {
        matchesScreenView = nil
    }
    
    
    func getMatchList()   {
        if(CheckInternet.isConnectedToInternet()){
            self.matchesScreenView?.startLoading()
            
            matchesScreenService.DownloadMatchListData(compId: 2000, season: "2018") {
                if (self.matchesScreenService.errorInresponse == false){
                    if self.matchesScreenService.emptyInresponse == false{
                        self.matchesScreenView?.updateMatchTableData(matchData: self.matchesScreenService.MatchListData)
                        self.matchesScreenView?.stopLoading()
                    }else{
                        self.matchesScreenView?.showAlert(_message: "No Available Competitions")
                        self.matchesScreenView?.stopLoading()
                    }
                } else {
                    self.matchesScreenView?.showRetryAlert(_message: "Something Went Wrong")
                    self.matchesScreenView?.stopLoading()
                }
            }
            
        }else{
            self.matchesScreenView?.showRetryAlert(_message: "Check Your Internet Connection")
            
        }
        
        
    }
    
    
    
}
