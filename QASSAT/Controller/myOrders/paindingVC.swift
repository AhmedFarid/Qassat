//
//  paindingVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class paindingVC: UIViewController ,UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var myOrder = [myOrders]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        handleRefresh()
    }
    
    @objc private func handleRefresh() {
        API_myOrders.panding{ (error: Error?, myOrder: [myOrders]?) in
            if let myOrder = myOrder {
                self.myOrder = myOrder
                print("xxx\(self.myOrder)")
                self.tableView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? bandding {
            let spar = myOrder[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else{
            return bandding()
        }
    }
}
