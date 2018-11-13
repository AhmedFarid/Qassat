//
//  myOrders.swift
//  QASSAT
//
//  Created by FARIDO on 10/31/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class myOrders: NSObject {
    
    var orderID: String
    var loanID: String
    var customerName: String
    var productName: String
    var Price: String
    var libraryName: String
    var imageProduct: String
    var addressLibrary: String
    var phoneLibrary: String
    var Deposit: String
    var loanDetails: String
    
    
    
    init?(dict: [String: JSON]){
        
        guard let orderID = dict["Order ID"]?.string, let loanID = dict["Loan ID"]?.string ,let customerName = dict["Customer Name"]?.string,let productName = dict["Product Name"]?.string,let Price = dict["Price"]?.string,let imageProduct = dict["imageProduct"]?.string,let libraryName = dict["Library Name"]?.string,let addressLibrary = dict["addressLibrary"]?.string,let phoneLibrary = dict["phoneLibrary"]?.string,let Deposit = dict["Deposit"]?.string,let loanDetails = dict["loanDetails"]?.string else {return nil}
        
        self.orderID = orderID
        self.loanID = loanID
        self.customerName = customerName
        self.productName = productName
        self.Price = Price
        self.libraryName = libraryName
        self.imageProduct = imageProduct
        self.addressLibrary = addressLibrary
        self.phoneLibrary = phoneLibrary
        self.Deposit = Deposit
        self.loanDetails = loanDetails
        
    }
}

class myloans: NSObject {
    
    var loanID: String
    var CustomerName: String
    var productName: String
    var cash: String
    var imageProduct: String
    var libraryName: String
    var addressLibrary: String
    var phoneLibrary: String
    var Price: String
    var Deposit: String
    var PriceLoan: Int
    var loanDetails: String
    var firstPayment: String
    var loanStatus: String
    
    
    
    init?(dict: [String: JSON]){
        
        guard let loanID = dict["loan ID"]?.string, let CustomerName = dict["Customer Name"]?.string, let productName = dict["Product Name"]?.string ,let cash = dict["Cash"]?.string,let imageProduct = dict["imageProduct"]?.string,let libraryName = dict["Library Name"]?.string,let addressLibrary = dict["addressLibrary"]?.string,let phoneLibrary = dict["phoneLibrary"]?.string,let Price = dict["Price"]?.string,let Deposit = dict["Deposit"]?.string,let PriceLoan = dict["PriceLoan"]?.int,let loanDetails = dict["loanDetails"]?.string,let FirstPayment = dict["First Payment"]?.string,let LoanStatus = dict["Loan Status"]?.string else {return nil}
        
        self.loanID = loanID
        self.CustomerName = CustomerName
        self.productName = productName
        self.cash = cash
        self.imageProduct = imageProduct
        self.libraryName = libraryName
        self.addressLibrary = addressLibrary
        self.phoneLibrary = phoneLibrary
        self.Price = Price
        self.Deposit = Deposit
        self.PriceLoan = PriceLoan
        self.loanDetails = loanDetails
        self.firstPayment = FirstPayment
        self.loanStatus = LoanStatus
        
    }
    
    
}

class myBayment: NSObject {
    
    var paymentID: String
    var amount: String
    var paymentAmount: String
    var remaining: String
    var paymentMethod: String
    var dueDate: String
    var collectionDate: String
    
    init?(dict: [String: JSON]){
        
        guard let paymentID = dict["Payment ID"]?.string, let amount = dict["amount"]?.string ,let paymentAmount = dict["payment_amount"]?.string,let remaining = dict["remaining"]?.string,let paymentMethod = dict["payment_method"]?.string,let dueDate = dict["due_date"]?.string,let collectionDate = dict["collection_date"]?.string else {return nil}
        
        self.paymentID = paymentID
        self.amount = amount
        self.paymentAmount = paymentAmount
        self.remaining = remaining
        self.paymentMethod = paymentMethod
        self.dueDate = dueDate
        self.collectionDate = collectionDate
    }
}

