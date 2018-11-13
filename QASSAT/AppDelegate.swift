//
//  AppDelegate.swift
//  QASSAT
//
//  Created by FARIDO on 10/26/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.sharedManager().enable = true
        if let user_token = helper.getAPIToken(){
            print("user_token\(user_token)")
            //go to main page
            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "main")
            window?.rootViewController = tab
        }
        Localizer.DoTheExchange()
        
        return true
    }
}

