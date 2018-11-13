//
//  API+Photos.swift
//  QASSAT
//
//  Created by FARIDO on 11/2/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class API_Photos: NSObject {

    class func createPhoto(address: String, first_name: String, last_name: String, email: String , password: String,ssn: String, phone: String,gender:String ,photo: UIImage, completion: @escaping (_ error: Error?, _ success: Bool,_ message: String?, _ data: String?)->Void) {
        
        //let lan = "en"

        //let url = URLs.upload+"?api_token=123"+"?lan=\(lan)"
        
        let urlx = "http://qussat.com/api/registerApple?api_token=1500&first_name=\(first_name)&last_name=\(last_name)&email=\(email)&password=\(password)&ssn=\(ssn)&phone=\(phone)&gender=\(gender)&address=\(address)"
        print(urlx)
        
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            if let data = photo.jpegData(compressionQuality: 0.2){
                form.append(data, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: urlx, method: .post, headers: nil) { (result: SessionManager.MultipartFormDataEncodingResult) in
            switch result {
            case .failure(let error):
                print(error)
                completion(error,false,nil,nil)
                
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.uploadProgress(closure: { (progress: Progress) in
                    print(progress)
                })
                upload.responseJSON(completionHandler: { (response: DataResponse<Any>) in
                    switch response.result
                    {
                    case .failure(let error):
                        print(error)
                        completion(error,false,nil,nil)
                        
                    case .success(let value):
                        let json = JSON(value)
                        print(json)
                        
                        if let status = json["status"].bool, status == true{
                            print("success")
                            if let message = json["data"]["message"].string {
                                print(message)
                            completion(nil,true,message,nil)
                            }
                        }else{
                            print("no")
                            if let data = json["data"].string {
                                print(data)
                            completion(nil,false,nil,data)
                            }
                        }
                    }
                })
            }
        }

    }
}
