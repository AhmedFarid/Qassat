//
//  prodectLoanCell.swift
//  QASSAT
//
//  Created by FARIDO on 10/29/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class prodectLoanCell: UITableViewCell {

    
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var Deposit: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var peroid: UILabel!
    
    func configuerCell(prodect: LoanProdects) {
        price.text = prodect.price
        Deposit.text = prodect.deposit
        duration.text = prodect.loanDuration
        peroid.text = prodect.period
        
    }
    
}
