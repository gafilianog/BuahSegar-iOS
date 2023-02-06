//
//  ViewController.swift
//  BuahSegar-iOS
//
//  Created by prk on 04/02/23.
//

import UIKit

class LoginRegisterViewController: UIViewController {
    
    @IBOutlet var vLogin: UIView!
    @IBOutlet var vRegister: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(vLogin)
    }


    @IBAction func actSegSwitchLoginRegister(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(vLogin)
            
        case 1:
            self.view.bringSubviewToFront(vRegister)
            
        default:
            break
        }
    }
    
    @IBAction func unwindToLoginRegister(_ unwindSegue: UIStoryboardSegue) {}
}

