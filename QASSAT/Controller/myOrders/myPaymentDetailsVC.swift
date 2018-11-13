//
//  myPaymentDetailsVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class myPaymentDetailsVC: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    var mybaymnet = [myBayment]()
    var singleitme: myloans?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        handleRefresh()
    }
    
    
    @objc private func handleRefresh() {
        API_myOrders.myPamenyment (loan_id: singleitme?.loanID ?? "") { (error: Error?, mybaymnet: [myBayment]?) in
            if let mybaymnet = mybaymnet {
                self.mybaymnet = mybaymnet
                print("xxx\(self.mybaymnet)")
                self.tableView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mybaymnet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  mybaymentDetils{
            let spar = mybaymnet[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else{
            return mybaymentDetils()
        }
    }
    
    
    

}
