//
//  HomeViewController.swift
//  BuahSegar-iOS
//
//  Created by prk on 04/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let env = Bundle.main.infoDictionary! ["BUAH_SEGAR_API_ENDPOINT"] as! String
    
    var fruits = [Fruit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(env)
        let url = URL(string: env)!
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: req) { data, res, err in
            
            if let err = err {
                print(err)
                return
            }
            
            let resFruits = try! JSONDecoder().decode([Fruit].self, from: data!)
            
            DispatchQueue.main.async {
                self.fruits = resFruits
                print(self.fruits.count)
            }
        }.resume()
        
        
    }
}
