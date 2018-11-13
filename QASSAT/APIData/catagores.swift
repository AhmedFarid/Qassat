//
//  catagores.swift
//  QASSAT
//
//  Created by FARIDO on 10/28/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class catagores: NSObject {
    
    var CategoryID: String
    var CategoryName : String
    var Image: String
    
    
    init?(dict: [String: JSON]){
        
        guard let CategoryID = dict["Category ID"]?.string, let CategoryName = dict["Category Name "]?.string ,let Image = dict["Image"]?.string else {return nil}
        
        self.CategoryID = CategoryID
        self.Image = Image
        self.CategoryName = CategoryName
    }
}
