//
//  SplashPresenter.swift
//  Ibtikar
//
//  Created by Samir on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import Foundation

protocol SplashView: NSObjectProtocol {
    func openHomeScreen(downloadedData : CompetitionsList?)
    func startLoading()
    func showAlert(_message: String)
    func showRetryAlert(_message: String)
    func stopLoading()
}


class SplashPresenter {
    fileprivate let SplashConfigService:SplashService
    weak fileprivate var splashview : SplashView?
    
    
    init(splashService:SplashService){
        self.SplashConfigService = splashService
    }
    
    func attachView(_ view:SplashView){
        splashview = view
    }
    
    func detachView() {
        splashview = nil
    }
    
    
    func getCompetitionList()   {
        if(CheckInternet.isConnectedToInternet()){
            self.splashview?.startLoading()
            
            SplashConfigService.DownloadCompListData() {
                if (self.SplashConfigService.errorInresponse == false){
                    if self.SplashConfigService.emptyInresponse == false{
                        self.splashview?.openHomeScreen(downloadedData: self.SplashConfigService.compData)
                        //print("test is   : \(self.SplashConfigService.compData)")
                        self.splashview?.stopLoading()
                    }else{
                        self.splashview?.showAlert(_message: "No Available Competitions")
                        self.splashview?.stopLoading()
                    }
                } else {
                    self.splashview?.showRetryAlert(_message: "Something Went Wrong")
                    self.splashview?.stopLoading()
                }
            }
            
        }else{
            self.splashview?.showRetryAlert(_message: "Check Your Internet Connection")
            
        }
        
        
    }
    
    
    
}
