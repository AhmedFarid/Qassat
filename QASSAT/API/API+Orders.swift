//
//  API+Orders.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Orders: NSObject {
    
    class func orderLoan(prodacteId: String,loanID: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String?)->Void) {
        
        let api_token = "11"
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false, nil)
            return
        }
        
        let url = URLs.addOrder
        
        
        let parameters = [
            "api_token": api_token,
            "lan": lan,
            "user_token": userToken,
            "product_id": prodacteId,
            "loan_id": loanID
            ] as [String : Any]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if let message = json["data"]["massage"].string {
                    print("orderId\(message)")
                    completion(nil, true,message)
                }
            }
        }
    }
}
