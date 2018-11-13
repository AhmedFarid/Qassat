//
//  bandding.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class bandding: UITableViewCell {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var prodeName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var vendorPhone: UILabel!
    @IBOutlet weak var venderName: UILabel!
    @IBOutlet weak var paymentMethod: UILabel!
    

    func configuerCell(prodect: myOrders) {
        prodeName.text = prodect.productName
        price.text = "\(prodect.Price) SR"
        let message = NSLocalizedString("vendor Phone", comment: "hhhh")
        vendorPhone.text = "\(message): \(prodect.phoneLibrary)"
        let messages = NSLocalizedString("Vendor Name", comment: "hhhh")
        venderName.text = "\(messages): \(prodect.libraryName)"
        let messagess = NSLocalizedString("Payment Method", comment: "hhhh")
        paymentMethod.text = "\(messagess): \(prodect.loanDetails)"
        
        
        img.image = UIImage(named: "placeholder")
        let s = ("\(URLs.mainImage)\(prodect.imageProduct)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
