//
//  API+Profile.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Profile: NSObject {
    class func profile(completion: @escaping (_ error: Error?, _ success: Bool, _ name: String?,_ image: String?, _ Gander: String?,_ phone: String?,_ Color: String?,_ remaining: String?)->Void) {
        
        let lan = NSLocalizedString("en", comment: "profuct list lang")
        guard let userToken = helper.getAPIToken() else {
            completion(nil,false,nil,nil,nil,nil,nil,nil)
            return
        }
        
        let url = URLs.profileCustomer
        let parameters = [
            "lan": lan,
            "user_token": userToken
            ] as [String : Any]
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil,nil,nil,nil,nil,nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(json)
                
                if let name = json["data"]["Name"].string {
                    print("orderId\(name)")
                    if let image = json["data"]["image"].string {
                        if let Gander = json["data"]["Gander"].string {
                            if let phone = json["data"]["phone"].string{
                                if let Color = json["data"]["Color"].string{
                                    if let remaining = json["data"]["remaining"].string{
                        completion(nil, true,name,image,Gander,phone,Color,remaining)
                                    }
                                }
                            }
                        }
                    }
                }
                
            }
        }
    }
}
