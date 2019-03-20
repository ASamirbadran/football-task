//
//  SplashViewController.swift
//  Ibtikar
//
//  Created by Samir on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Alamofire

class SplashViewController: UIViewController {
    @IBOutlet weak var SplashLoader: NVActivityIndicatorView!
    var downloadedCompCVData : CompetitionsList?
    fileprivate let splashPresenter = SplashPresenter(splashService: SplashService())
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.SplashLoader.color = UIColor(red:255/255, green:255/255, blue:255/255, alpha:1.0)
        self.SplashLoader.type = .ballClipRotatePulse
        
        splashPresenter.attachView(self)
        splashPresenter.getCompetitionList()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SplashToHome"{
            let navVC = segue.destination as? UINavigationController
             let HomeCompVC = navVC?.viewControllers.first as! CompetitionsCollectionViewController
                HomeCompVC.sentCompCVData = downloadedCompCVData
            
        }
    }

    


}
extension SplashViewController: SplashView {

    
    func showAlert(_message: String) {
        ShowAlertUtility.DisplayAlert(title: "Error", message: _message, in: self)

    }
    
    func showRetryAlert(_message: String) {
        ShowAlertUtility.DisplayRetryAlert(title: "Error", message: _message, in: self)

    }
    
    func stopLoading() {
        self.SplashLoader.stopAnimating()

    }
    
    func openHomeScreen(downloadedData : CompetitionsList?) {
           downloadedCompCVData = downloadedData
            self.performSegue(withIdentifier: "SplashToHome", sender: self)
    }
    
    func startLoading() {
        self.SplashLoader.startAnimating()

    }
    
}


