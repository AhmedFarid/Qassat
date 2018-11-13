//
//  API+Auth.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Auth: NSObject {
    
    class func login(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        let apiToken = "123asd"
        let url = URLs.login
        let parameters = [
            "api_token": apiToken,
            "email": email,
            "password": password
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["data"]["user_token"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true)
                }
                
            }
        }
        
    }
}
