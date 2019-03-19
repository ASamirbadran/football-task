//
//  SplashViewController.swift
//  Ibtikar
//
//  Created by Samir on 3/19/19.
//  Copyright © 2019 Ahmed Samir AbdElMaaboud. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class SplashViewController: UIViewController {

    @IBOutlet weak var SplashLoader: NVActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.SplashLoader.color = UIColor(red:255/255, green:255/255, blue:255/255, alpha:1.0)
        self.SplashLoader.type = .ballClipRotatePulse
        self.SplashLoader.startAnimating()
        OpenHomeScreen()
        
    }
    

 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SplashToHome"{
        }
    }

    
    
    func OpenHomeScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            self.performSegue(withIdentifier: "SplashToHome", sender: self)
        })
    }
}
