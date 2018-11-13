//
//  gustLoginVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/26/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class gustLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
    
    @IBDesignable extension UINavigationController {
        @IBInspectable var barTintColor: UIColor? {
            set {
                guard let uiColor = newValue else { return }
                navigationBar.barTintColor = uiColor
            }
            get {
                guard let color = navigationBar.barTintColor else { return nil }
                return color
            }
        }
        @IBInspectable var barTextColor: UIColor? {
            set {
                guard let uiColor = newValue else {return}
                navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: uiColor]
            }
            get {
                guard let textAttributes = navigationBar.titleTextAttributes else { return nil }
                return textAttributes[NSAttributedString.Key.foregroundColor] as? UIColor
            }
        }
}
