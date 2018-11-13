//
//  prodectsDetailsVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
// LoanProdects

import UIKit
import Kingfisher

class prodectsDetailsVC: UIViewController, UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var tabeleView: UITableView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var catname: UILabel!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var vendorPhone: UILabel!
    @IBOutlet weak var vendorAdderss: UILabel!
    @IBOutlet weak var vendorName: UILabel!
    
    var LoanProdec = [LoanProdects]()
    var singelItems : prodects?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prodectsfunc()
        
        tabeleView.delegate = self
        tabeleView.dataSource = self
        
        name.text = singelItems?.ProductName
        model.text = singelItems?.ModelProduct
        catname.text = singelItems?.CategoryName
        brand.text = singelItems?.BrandName
        price.text = "\(singelItems?.Price ?? "") SR"
        vendorName.text = singelItems?.nameVendor
        vendorAdderss.text = singelItems?.addressVendor
        vendorPhone.text = singelItems?.phoneVendor
        
        img.image = UIImage(named: "placeholder")
        let s = ("\(URLs.mainImage)\(singelItems?.Image ?? "")")
        let encodedLink = s.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        
        img.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            print("g\(url)")
            img.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeholder"), options: nil, progressBlock: nil, completionHandler: nil)
            
            
        }
    }
    
    
    @objc private func prodectsfunc() {
        API_Laon.laonDeatiles(product_id: singelItems?.ProductID ?? "0") {(error: Error?, LoanProdec: [LoanProdects]?)in
            if let LoanProdec = LoanProdec {
                self.LoanProdec = LoanProdec
                print("xxx\(self.LoanProdec)")
                self.tabeleView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LoanProdec.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tabeleView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? prodectLoanCell {
            let spar = LoanProdec[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else{
            return prodectLoanCell()
        }
    }
    
    
    @IBAction func loanBtn(_ sender: Any) {
        performSegue(withIdentifier: "suge", sender: nil)
    }
    @IBAction func cachBtn(_ sender: Any) {
        performSegue(withIdentifier: "sugeCacH", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let Byloan = segue.destination as? ByloanVC {
        Byloan.ima = singelItems?.Image ?? ""
        Byloan.nam = singelItems?.ProductName ?? ""
        Byloan.pri = singelItems?.Price ?? ""
        Byloan.prodactID = singelItems?.ProductID ?? "" 
    }else if let ByCach = segue.destination as? ByCach {
        ByCach.ima = singelItems?.Image ?? ""
        ByCach.pri = singelItems?.Price ?? ""
        ByCach.nam = singelItems?.ProductName ?? ""
        
        }
    }
}
