//
//  API+myOrders.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_myOrders: NSObject {
    
    class func panding(completion: @escaping (_ error: Error?,_ sparParts: [myOrders]?)-> Void) {
        let url = URLs.getOrder
        
        
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        
        
        let parameters: [String: Any] = [
            "lan": lan,
            "user_token": userToken
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myOrders]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myOrders.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func myLoans(completion: @escaping (_ error: Error?,_ sparParts: [myloans]?)-> Void) {
        let url = URLs.getLoan
        
        
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        
        
        let parameters: [String: Any] = [
            "lan": lan,
            "user_token": userToken
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myloans]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myloans.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func myPamenyment(loan_id: String, completion: @escaping (_ error: Error?,_ sparParts: [myBayment]?)-> Void) {
        let url = URLs.detailsPayment
        
        
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,nil)
            return
        }
        
        
        let parameters: [String: Any] = [
            "lan": lan,
            "user_token": userToken,
            "loan_id": loan_id
        ]
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON  { response in
            
            
            switch response.result
            {
            case .failure(let error):
                completion(error, nil)
                print(error)
                
            case .success(let value):
                print(value)
                let json = JSON(value)
                guard let dataArray = json["data"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [myBayment]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = myBayment.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
