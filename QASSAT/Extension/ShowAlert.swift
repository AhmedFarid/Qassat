//
//  ShowAlert.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, okTitle: String = "Ok", okHandler: ((UIAlertAction)->Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: okTitle, style: .cancel, handler: okHandler))
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
