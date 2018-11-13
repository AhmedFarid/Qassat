//
//  ByCach.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import Kingfisher

class ByCach: UIViewController {

    var singelItems : prodects?
    
    var ima = ""
    var nam = ""
    var pri = ""
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var prodectName: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodectName.text = nam
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
    
    
    @IBAction func cachBtn(_ sender: Any) {
    }
    

}
