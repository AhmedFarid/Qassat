//
//  approvedVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class approvedVC: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    var myLoan = [myloans]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_myOrders.myLoans{ (error: Error?, myLoan: [myloans]?) in
            if let myLoan = myLoan {
                self.myLoan = myLoan
                print("xxx\(self.myLoan)")
                self.tableView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myLoan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?  Approved{
            let spar = myLoan[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else{	
            return Approved()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "suge", sender: myLoan[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? myPaymentDetailsVC{
            distantion.singleitme = sender as? myloans
        }
    }
}
