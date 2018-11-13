//
//  Approved.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class Approved: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var prodeName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var vendorPhone: UILabel!
    @IBOutlet weak var venderName: UILabel!
    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var paymentDate: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    @IBOutlet weak var Deposit: UILabel!
    @IBOutlet weak var pricewithLoan: UILabel!
    
    
    func configuerCell(prodect: myloans) {
        prodeName.text = prodect.productName
        price.text = "\(prodect.cash) SR"
        let messagessssss = NSLocalizedString("vendor Phone", comment: "hhhh")
        vendorPhone.text = "\(messagessssss): \(prodect.phoneLibrary)"
        let messagesssss = NSLocalizedString("Vendor Name", comment: "hhhh")
        venderName.text = "\(messagesssss): \(prodect.libraryName)"
        let messagessss = NSLocalizedString("Payment Method", comment: "hhhh")
        paymentMethod.text = "\(messagessss): \(prodect.loanDetails)"
        let messagesss = NSLocalizedString("Frist Payment Date", comment: "hhhh")
        paymentDate.text = "\(messagesss): \(prodect.firstPayment)"
        let messagess = NSLocalizedString("Price After Deposit", comment: "hhhh")
        totalPrice.text = "\(messagess): \(prodect.PriceLoan) SR"
        let messages = NSLocalizedString("Deposit", comment: "hhhh")
        Deposit.text = "\(messages): \(prodect.Deposit) SR"
        let message = NSLocalizedString("Total Price", comment: "hhhh")
        pricewithLoan.text = "\(message): \(prodect.PriceLoan) SR"
        
        
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
