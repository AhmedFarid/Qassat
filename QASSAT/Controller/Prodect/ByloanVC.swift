//
//  ByloanVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class ByloanVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {

    var ima = ""
    var nam = ""
    var pri = ""
    var prodactID = ""
    var loan = 0
    var message = ""
    
    
    var loaNDrobDown = [loanBroectsDropDown]()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var prodName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var pikView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pikView.delegate = self
        pikView.dataSource = self
        
        prodectsfunc()
        
        prodName.text = nam
        price.text = "\(pri) SR"
        
        image.image = UIImage(named: "placeholder")
        let s = ("\(URLs.mainImage)\(ima)")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        image.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            image.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
    
    @objc private func prodectsfunc() {
        
        API_Laon.laonDeatilesDrobDown(product_id: prodactID) {(error: Error?, loaNDrobDown: [loanBroectsDropDown]?)in
            if let loaNDrobDown = loaNDrobDown {
                self.loaNDrobDown = loaNDrobDown
                print("xxx\(self.loaNDrobDown)")
                self.pikView.reloadAllComponents()
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return loaNDrobDown.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return loaNDrobDown[row].Loan
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.loan = loaNDrobDown[row].LoanID
    }
    

    @IBAction func loanBtn(_ sender: Any) {
        API_Orders.orderLoan(prodacteId: prodactID, loanID: "\(loan)") { (error: Error?, success: Bool, message) in
            if success {
                self.message = message ?? ""
                print("0000\(self.message)")
                
                let messages = NSLocalizedString("order success please check vendor accepting in my orders", comment: "hhhh")
                self.showAlert(title: message ?? "", message: messages)
            }else{
                //self.showAlert(title: "Add To Cart Success", message: "Go to cart to finsh your order ")
                let message = NSLocalizedString("Login Frist", comment: "hhhh")
                let title = NSLocalizedString("order failed", comment: "hhhh")
                self.showAlert(title: title, message: message)
            }
            
            
        }
    }
}
