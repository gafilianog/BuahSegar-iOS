//
//  LoginViewController.swift
//  BuahSegar-iOS
//
//  Created by prk on 04/02/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var tfUsername: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actLogin(_ sender: Any) {
        let username = tfUsername.text!
        let password = tfPassword.text!
        
        let req = User.fetchRequest()
        req.predicate = NSPredicate(format: "username = %@", username)
        
        let res = try! AppDelegate.mCtx.fetch(req)
        
        if res.count == 0 {
            showAlert(title: "User Not Found", message: "Username may not exist or wrong")
            return
        }
        
        let user = res.first!
        
        if user.password != password {
            showAlert(title: "Wrong Password", message: "Password entered is wrong!")
            return
        }
        AppDelegate.currUser = user
        performSegue(withIdentifier: "toHome", sender: self)
    }
}
