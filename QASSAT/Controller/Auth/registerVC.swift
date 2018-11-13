//
//  registerVC.swift
//  QASSAT
//
//  Created by FARIDO on 10/26/18.
//  Copyright © 2018 E-Bakers. All rights reserved.
//

import UIKit

class registerVC: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    @IBOutlet weak var pikerview: UIPickerView!
    
    
    @IBOutlet weak var fName: placeholderColor!
    @IBOutlet weak var lastName: placeholderColor!
    @IBOutlet weak var email: placeholderColor!
    @IBOutlet weak var ssnID: placeholderColor!
    @IBOutlet weak var phone: placeholderColor!
    @IBOutlet weak var addresss: placeholderColor!
    @IBOutlet weak var passw: placeholderColor!
    @IBOutlet weak var photoSnn: UIImageView!
    

    var gender = [NSLocalizedString("Male", comment: "hhhh"),NSLocalizedString("Female", comment: "hhhh")]
    var genderSelected = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        pikerview.delegate = self
        pikerview.dataSource = self
        
    }
    
    var piker_image: UIImage? {
        didSet{
            
            guard let image = piker_image else {return}
            self.photoSnn.image = image
        }
    }
    
    
    @objc private func handleAdd(){
        let piker = UIImagePickerController()
        piker.allowsEditing = true
        piker.sourceType = .photoLibrary
        piker.delegate = self
        self.present(piker, animated: true, completion: nil)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if gender[row] == "ذكر" {
        self.genderSelected = "Male"
        } else if gender[row] == "Male"{
            self.genderSelected = "Male"
        }else {
            self.genderSelected = "Female"
        }
        print("\(self.genderSelected)")
    }
    
    

    @IBAction func ssNPhoto(_ sender: Any) {
        handleAdd()
    }
    @IBAction func signUP(_ sender: Any) {
        
        guard let fristName = fName.text, !fristName.isEmpty else {
            let message = NSLocalizedString("Enter Frist Name", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
        
        guard let lastNames = lastName.text, !lastNames.isEmpty else {
            let message = NSLocalizedString("Enter Last Name", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
        
        guard let ssnIDs = ssnID.text, !ssnIDs.isEmpty else {
            let message = NSLocalizedString("Enter Your ID Number", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
        
        guard let phones = phone.text, !phones.isEmpty else {
            let message = NSLocalizedString("Enter Your Phone Number", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
        
        guard let addressss = addresss.text, !addressss.isEmpty else {
            let message = NSLocalizedString("Enter Your address", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
     
        guard let passwS = passw.text, !passwS.isEmpty else {
            let message = NSLocalizedString("Enter Your Password", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
        
        guard let idPhoto = photoSnn.image, idPhoto !=  #imageLiteral(resourceName: "placeholder") else {
            let message = NSLocalizedString("Enter Your Photo ID", comment: "hhhh")
            let title = NSLocalizedString("SignUp Filed", comment: "hhhh")
            self.showAlert(title: title, message: message)
            return
            
        }
        
        
        guard let emails = email.text, !emails.isEmpty else { return }
        if isValidEmail(testStr: emails) == false {
            let message = NSLocalizedString("email not correct", comment: "msg list lang")
            self.showAlert(title: "SignUp Filed", message: message)
        }
        
        
        
        
        API_Photos.createPhoto(address: addresss.text ?? "", first_name: fName.text ?? "", last_name: lastName.text ?? "", email: email.text ?? "", password: passw.text ?? "", ssn: ssnID.text ?? "", phone: phone.text ?? "", gender: genderSelected, photo: photoSnn.image ?? #imageLiteral(resourceName: "placeholder")) { (error: Error?, success: Bool,message,data) in
            if success {
                self.showAlert(title: "SignUp", message: "\(message ?? "")")
            }else {
               self.showAlert(title: "Failed", message: "\(data ?? "")")
            }
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}

extension registerVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.piker_image = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.piker_image = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
