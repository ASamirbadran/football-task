//
//  TeamsPresenter.swift
//  Ibtikar
//
//  Created by Samir on 3/22/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation

protocol TeamsScreenView: NSObjectProtocol {
    func updateTeamsTableData(TeamData : TeamsList?)
    func startLoading()
    func showAlert(_message: String)
    func showRetryAlert(_message: String)
    func stopLoading()
}


class TeamsPresenter {
    fileprivate let teamsService:TeamsService
    weak fileprivate var teamsScreenView : TeamsScreenView?
    
    
    init(_teamsService:TeamsService){
        self.teamsService = _teamsService
    }
    
    func attachView(_ view:TeamsScreenView){
        teamsScreenView = view
    }
    
    func detachView() {
        teamsScreenView = nil
    }
    
    func getTeamsList(_compId : Int , _season : String)   {
        if(CheckInternet.isConnectedToInternet()){
            self.teamsScreenView?.startLoading()
            
            teamsService.DownloadTeamListData(compId: _compId, season:CusDateFormat.TrimDate(date: _season)) {
                if (self.teamsService.errorInresponse == false){
                    if self.teamsService.emptyInresponse == false{
                        self.teamsScreenView?.updateTeamsTableData(TeamData: self.teamsService.TeamsListData)
                        self.teamsScreenView?.stopLoading()
                    }else{
                        self.teamsScreenView?.showAlert(_message: "No Available Teams")
                        self.teamsScreenView?.stopLoading()
                    }
                } else {
                    self.teamsScreenView?.showRetryAlert(_message: "Something Went Wrong")
                    self.teamsScreenView?.stopLoading()
                }
            }
            
        }else{
            self.teamsScreenView?.showRetryAlert(_message: "Check Your Internet Connection")
            
        }
        
        
    }
    
    
    
}
