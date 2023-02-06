//
//  RegisterViewController.swift
//  BuahSegar-iOS
//
//  Created by prk on 06/02/23.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var tfFullNameRegister: UITextField!
    @IBOutlet var tfUsernameRegister: UITextField!
    @IBOutlet var tfPasswordRegister: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actRegister(_ sender: Any) {
        let fullName = tfFullNameRegister.text!
        let username = tfUsernameRegister.text!
        let password = tfPasswordRegister.text!
        
        let isFullNameValid = validateFullName(fullname: fullName)
        let isUsernameValid = validateUsername(username: username)
        let isPasswordValid = validatePassword(password: password)
        
        if isFullNameValid && isUsernameValid && isPasswordValid {
            let user = User(context: AppDelegate.mCtx)
            user.full_name = fullName
            user.username = username
            user.password = password
            try! AppDelegate.mCtx.save()
            
            tfFullNameRegister.text = ""
            tfUsernameRegister.text = ""
            tfPasswordRegister.text = ""
            
            showAlert(title: "Success", message: "Successfully register new account!")
        }
    }
    
    func validateFullName(fullname: String) -> Bool {
        if fullname.isEmpty {
            showAlert(title: "Full Name Error", message: "Full name cannot be empty!")
            return false
        }
        
        return true
    }
    
    func validateUsername(username: String) -> Bool {
        let req = User.fetchRequest()
        req.predicate = NSPredicate(format: "username = %@", username)
        
        let res = try! AppDelegate.mCtx.fetch(req)
        
        if res.count != 0 {
            showAlert(title: "Username Error", message: "Username already taken!")
            return false
        }
        
        return true
    }
    
    func validatePassword(password: String) -> Bool {
        if password.count < 8 {
            showAlert(title: "Password Error", message: "Password must contains at least 8 charcters")
            return false
        }
        
        return true
    }
}
