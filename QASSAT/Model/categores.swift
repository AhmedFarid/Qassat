//
//  categores.swift
//  QASSAT
//
//  Created by FARIDO on 10/28/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class categores: UICollectionViewCell {
    
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    
    func configuerCell(prodect: catagores) {
        name.text = prodect.CategoryName
        Image.image = UIImage(named: "placeholder")
        let s = ("\(URLs.mainImage)\(prodect.Image)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        Image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            Image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
