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
        performSegue(withIdentifier: "toHome", sender: self)
    }
}
