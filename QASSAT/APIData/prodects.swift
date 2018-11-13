//
//  prodects.swift
//  QASSAT
//
//  Created by FARIDO on 10/28/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit
import SwiftyJSON

class prodects: NSObject {
    
    
    var ProductID: String
    var ProductName : String
    var Image: String
    var Price: String
    var ModelProduct: String
    var CategoryName: String
    var BrandName: String
    var nameVendor: String
    var addressVendor: String
    var phoneVendor: String
    
    init?(dict: [String: JSON]){
        
        guard let ProductID = dict["Product ID"]?.string, let ProductName = dict["Product Name"]?.string ,let Image = dict["Image"]?.string,let Price = dict["Price"]?.string,let ModelProduct = dict["Model Product"]?.string,let CategoryName = dict["Category Name"]?.string,let BrandName = dict["Brand Name"]?.string,let nameVendor = dict["nameVendor"]?.string,let addressVendor = dict["addressVendor"]?.string,let phoneVendor = dict["phoneVendor"]?.string else {return nil}
        
        self.ProductID = ProductID
        self.ProductName = ProductName
        self.Image = Image
        self.Price = Price
        self.ModelProduct = ModelProduct
        self.CategoryName = CategoryName
        self.BrandName = BrandName
        self.nameVendor = nameVendor
        self.addressVendor = addressVendor
        self.phoneVendor = phoneVendor
        
    }
}

class LoanProdects: NSObject {
    
    
    var LoanID: Int
    var productID : String
    var price: String
    var deposit: String
    var loanDuration: String
    var period: String
    
    
    init?(dict: [String: JSON]){
        
        guard let LoanID = dict["Loan ID"]?.int, let productID = dict["Product ID"]?.string ,let price = dict["Price"]?.string,let deposit = dict["Deposit"]?.string,let loanDuration = dict["Loan Duration"]?.string,let period = dict["Period"]?.string else {return nil}
        
        self.LoanID = LoanID
        self.productID = productID
        self.price = price
        self.deposit = deposit
        self.loanDuration = loanDuration
        self.period = period
    }
}


class loanBroectsDropDown : NSObject {
    
    
    var LoanID: Int
    var Loan : String
    
    init?(dict: [String: JSON]){
        
        guard let LoanID = dict["Loan ID"]?.int, let Loan = dict["Loan"]?.string else {return nil}
        
        self.LoanID = LoanID
        self.Loan = Loan
    }
}
