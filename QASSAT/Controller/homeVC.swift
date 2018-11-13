//
//  homeVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/26/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class homeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var catBunner: UICollectionView!
    @IBOutlet weak var prodectCollection: UICollectionView!
    
    @IBOutlet weak var catName: UILabel!
    var banners = [Banner]()
    var catagor = [catagores]()
    var prodec = [prodects]()
    var singleitemcat: catagores?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         if helper.getAPIToken() != nil {
            let message = NSLocalizedString("LogOut", comment: "hhhh")
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: message, style: .plain, target: self, action: #selector(Logout))
         }else {
            let message = NSLocalizedString("Back", comment: "hhhh")
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: message, style: .plain, target: self, action: #selector(Back))
        }
        
        bannerCollection.dataSource = self
        bannerCollection.delegate = self
        
        catBunner.delegate = self
        catBunner.dataSource = self
        
        prodectCollection.delegate = self
        prodectCollection.dataSource = self
        
        prodectCollection.alwaysBounceVertical = true
        
        handleRefresh()
        category()
        prodectsfunc()
    }
    
    
    @objc func Logout() {
        helper.dleteAPIToken()
    }
    
    @objc func Back() {
        dismiss(animated: false, completion: nil)
    }
    
    
    @objc private func prodectsfunc() {
        
        API_Home.prodect(category_id: singleitemcat?.CategoryID ?? "0") {(error: Error?, prodec: [prodects]?)in
            if let prodec = prodec {
                self.prodec = prodec
                print("xxx\(self.prodec)")
                self.catName.text = self.singleitemcat?.CategoryName ?? ""
                self.prodectCollection.reloadData()
            }
        }
    }
    
    @objc private func handleRefresh() {
        
        API_Home.banner { (error: Error?, banners: [Banner]?) in
            if let banners = banners {
                self.banners = banners
                print("xxx\(self.banners)")
                self.bannerCollection.reloadData()
            }
        }
    }
    
    @objc private func category() {
        
        API_Home.catagore { (error: Error?, catagor: [catagores]?) in
            if let catagor = catagor {
                self.catagor = catagor
                print("xxx\(self.catagor)")
                self.catBunner.reloadData()
            }
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView.tag == 0 {
            return 1
        }else if collectionView.tag == 2 {
            return 1
        }else {
            return 1
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return catagor.count
        }else if collectionView.tag == 2 {
            return banners.count
        }else {
            return prodec.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 2{
        if let cell = bannerCollection.dequeueReusableCell(withReuseIdentifier: "CellBanner", for: indexPath) as? bannerCell{
            let spar = banners[indexPath.row]
            cell.configuerCell(prodect: spar)
            return cell
        }else {
            return bannerCell()
            }
        }else if collectionView.tag == 0 {
            if let cell = catBunner.dequeueReusableCell(withReuseIdentifier: "cellCat", for: indexPath) as? categores{
                let spar = catagor[indexPath.row]
                cell.configuerCell(prodect: spar)
                return cell
            }else {
                return categores()
            }
        }else {
            if let cell = prodectCollection.dequeueReusableCell(withReuseIdentifier: "cellProdect", for: indexPath) as? prodect{
                let spar = prodec[indexPath.row]
                cell.configuerCell(prodect: spar)
                return cell
            }else {
                return prodect()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 0 {
            return CGSize.init(width: 90, height: 90)
        }else if collectionView.tag == 2 {
            let screenWidth = UIScreen.main.bounds.width
            return CGSize.init(width: screenWidth, height: screenWidth)
            
        }else {
            let screenWidth = UIScreen.main.bounds.width
            var width = (screenWidth-30)/2
            
            width = width < 130 ? 160 : width
            
            return CGSize.init(width: width, height: width)
        }
        
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 0 {
            singleitemcat = catagor[indexPath.row]
            prodectsfunc()
        }else if collectionView.tag == 3 {
            performSegue(withIdentifier: "suge", sender: prodec[indexPath.row])
        }else {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let distantion = segue.destination as? prodectsDetailsVC{
            if let prodacet = sender as? prodects {
                distantion.singelItems = prodacet
                
            }
        }
    }
    
    
    
    @IBAction func profileButon(_ sender: Any) {
        if helper.getAPIToken() != nil {
            performSegue(withIdentifier: "sugeProfile", sender: nil)
        }else {
            let message = NSLocalizedString("Please Login Frist", comment: "hhhh")
            let title = NSLocalizedString("Login Required", comment: "hhhh")
            self.showAlert(title: title, message: message)
        }
    }
    @IBAction func langBTN(_ sender: Any) {
        if Language.currentLanguage() == "ar" {
            Language.setAppLanguage(lang: "en-US")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            Language.setAppLanguage(lang: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        
        
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let api_token = helper.getAPIToken(){
            print(api_token)
            //            let tab = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "swrer")
            //            window?.rootViewController = tab
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "main")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            
        }else{
            window?.rootViewController = sb.instantiateViewController(withIdentifier: "mainVC")
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        }
    }
}

