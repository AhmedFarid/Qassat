//
//  API+Laon.swift
//  QASSAT
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Laon: NSObject {
    
    class func laonDeatiles(product_id: String,completion: @escaping (_ error: Error?,_ sparParts: [LoanProdects]?)-> Void) {
        let url = URLs.loanproductdetails
        
        let api_token = "11"
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lan": lan,
            "product_id": product_id
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
                var products = [LoanProdects]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = LoanProdects.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }
    
    
    class func laonDeatilesDrobDown(product_id: String,completion: @escaping (_ error: Error?,_ sparParts: [loanBroectsDropDown]?)-> Void) {
        let url = URLs.loanProduct
        
        let api_token = "11"
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        
        let parameters: [String: Any] = [
            "api_token": api_token,
            "lan": lan,
            "product_id": product_id
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
                guard let dataArray = json["data"]["loans"].array else{
                    completion(nil, nil)
                    return
                }
                print(dataArray)
                var products = [loanBroectsDropDown]()
                for data in dataArray {
                    if let data = data.dictionary, let prodect = loanBroectsDropDown.init(dict: data){
                        products.append(prodect)
                    }
                }
                completion(nil, products)
            }
        }
    }

}
