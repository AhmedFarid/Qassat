//
//  Banner.swift
//  QASSAT
//
//  Created by FARIDO on 10/27/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON


class Banner: NSObject {
    
    var ID: String
    var Image: String
    
     init?(dict: [String: JSON]){
        
        guard let ID = dict["ID"]?.string, let Image = dict["Image"]?.string else {return nil}
        
        self.ID = ID
        self.Image = Image
    }
}
