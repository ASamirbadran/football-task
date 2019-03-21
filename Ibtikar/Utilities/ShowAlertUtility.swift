//
//  ShowAlertUtility.swift
//  Ibtikar
//
//  Created by Ahmed Samir AbdElMaaboud on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//


import Foundation
import UIKit
class ShowAlertUtility{
    
    class func DisplayAlert(title: String, message: String, in vc: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    class func DisplayRetryAlert(title: String, message: String, in vc: UIViewController){//for internet connection
        
        let displayRetryAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let openAction = UIAlertAction(title: "Retry", style: .default) { (action) in
            vc.viewDidLoad()
        }
        displayRetryAlert.addAction(openAction)
        displayRetryAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            
            displayRetryAlert.dismiss(animated: true, completion: nil)}))
        
        vc.present(displayRetryAlert, animated: true, completion: nil)
    }
    
    
    class func DisplayGeneralRetryAlert(title: String, message: String, in vc: UIViewController){//for internet connection
        
        let displayRetryAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let openAction = UIAlertAction(title: "Retry", style: .default) { (action) in
            vc.viewDidLoad()
        }
        displayRetryAlert.addAction(openAction)
        displayRetryAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (action: UIAlertAction!) in
            
            displayRetryAlert.dismiss(animated: true, completion: nil)}))
        UIApplication.shared.keyWindow?.rootViewController?.present(displayRetryAlert, animated: true, completion: nil)
        
    }
    
    
    
}


