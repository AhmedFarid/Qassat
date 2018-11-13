//
//  ProfileVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/30/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    var x = ""
    var y = ""
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var myRemaing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
        
        viewColor.layer.borderWidth = 1
        viewColor.layer.masksToBounds = false
        viewColor.layer.borderColor = UIColor.black.cgColor
        viewColor.layer.cornerRadius = viewColor.frame.height/2
        viewColor.clipsToBounds = true
        
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_Profile.profile { (error: Error?, success, name,image,Gander,phone,Color,remaining) in
            self.name.text = name ?? ""
            print(self.name)
            self.x = image ?? ""
            self.gender.text = Gander ?? ""
            self.phone.text = phone ?? ""
            self.y = Color ?? ""
            self.myRemaing.text = remaining ?? ""
            if self.y == "white" {
            self.viewColor.backgroundColor = UIColor.white
            }else if self.y == "black" {
                self.viewColor.backgroundColor = UIColor.black
            }else {
                self.viewColor.backgroundColor = UIColor.orange
            }
        }
    }
}
