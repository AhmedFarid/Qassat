//
//  helper.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class helper: NSObject {
    
    
    class func restartApp(){
    guard let window = UIApplication.shared.keyWindow else {return}
    let sb = UIStoryboard(name: "Main", bundle: nil)
    var vc: UIViewController
    if getAPIToken() == nil {
        vc = sb.instantiateInitialViewController()!
    }else {
        vc = sb.instantiateViewController(withIdentifier: "main")
    }
    window.rootViewController = vc
    UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func saveAPIToken(token: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "user_token")
        def.synchronize()
        
        restartApp()
    }
    
    class func dleteAPIToken() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "user_token")
        def.synchronize()
        
        restartApp()
    }
    
    class func getAPIToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user_token") as? String
    }
}
