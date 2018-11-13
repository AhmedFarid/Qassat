//
//  API+Home.swift
//  QASSAT
//
//  Created by FARIDO on 10/27/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//catagores prodects

import UIKit
import Alamofire
import SwiftyJSON

class API_Home: NSObject {
    
    class func banner(completion: @escaping (_ error: Error?,_ sparParts: [Banner]?)-> Void) {
        let url = URLs.banner
        
        let api_token = "11"
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lan": lan
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
                var products = [Banner]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = Banner.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func catagore(completion: @escaping (_ error: Error?,_ sparParts: [catagores]?)-> Void) {
        let url = URLs.category
        
        let api_token = "11"
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lan": lan
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
                var products = [catagores]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = catagores.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    class func prodect(category_id: String,completion: @escaping (_ error: Error?,_ sparParts: [prodects]?)-> Void) {
        let url = URLs.product
        
        let api_token = "11"
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lan": lan,
            "category_id":category_id
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
                var products = [prodects]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = prodects.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
}
