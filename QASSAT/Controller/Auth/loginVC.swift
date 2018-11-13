//
//  loginVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/26/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class loginVC: UIViewController {

    @IBOutlet weak var email: placeholderColor!
    @IBOutlet weak var password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func signINBTN(_ sender: Any) {
        guard let email = email.text, !email.isEmpty else {
            let message = NSLocalizedString("Enter Your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
        }
        guard let password = password.text, !password.isEmpty else {
            let message = NSLocalizedString("Enter Your Password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
        }
        
        API_Auth.login(email: email, password: password) { (error: Error?, success: Bool) in
            if success {
                let message = NSLocalizedString("Sorry Try again and check your Email or Password", comment: "hhhh")
                let title = NSLocalizedString("Login Filed", comment: "hhhh")
                self.showAlert(title: title, message: message)
            }else{
                let message = NSLocalizedString("Sorry Try again and check your connection ", comment: "hhhh")
                let title = NSLocalizedString("Login Filed", comment: "hhhh")
                self.showAlert(title: title, message: message)
            }
            let message = NSLocalizedString("Sorry Try again and check your Email or Password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
        }
        
    }
    
}
