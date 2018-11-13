//
//  mybaymentDetils.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class mybaymentDetils: UITableViewCell {

    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var paymentAmount: UILabel!
    @IBOutlet weak var remainng: UILabel!
    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var collectionDate: UILabel!
    @IBOutlet weak var due_date: UILabel!



    func configuerCell(prodect: myBayment) {
        amount.text = prodect.amount
        paymentAmount.text = prodect.paymentAmount
        remainng.text = prodect.remaining
        paymentMethod.text = prodect.paymentMethod
        let messagessssss = NSLocalizedString("Collection Date", comment: "hhhh")
        collectionDate.text = "\(messagessssss): \(prodect.collectionDate)"
        let messagesss = NSLocalizedString("Due Date", comment: "hhhh")
        due_date.text = "\(messagesss): \(prodect.dueDate)"
    }
}
