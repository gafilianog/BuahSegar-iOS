//
//  HomeViewController.swift
//  BuahSegar-iOS
//
//  Created by prk on 04/02/23.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet var tblFruits: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    let env = Bundle.main.infoDictionary! ["BUAH_SEGAR_API_ENDPOINT"] as! String
    
    var fruits = [Fruit]()
    var fruitSearch = [Fruit]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblFruits.dataSource = self
        searchBar.delegate = self
        
        let url = URL(string: env + "/all")!
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: req) { data, _, err in
            
            if let err = err {
                print(err)
                return
            }
            
            let resFruits = try! JSONDecoder().decode([Fruit].self, from: data!)
            
            DispatchQueue.main.async {
                self.fruits = resFruits
                self.fruitSearch = resFruits
                
                self.tblFruits.reloadData()
            }
        }.resume()
    }
    
    
    @IBAction func actLogout(_ sender: Any) {
        AppDelegate.currUser = User()
        performSegue(withIdentifier: "toLoginRegister", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFruits.dequeueReusableCell(withIdentifier: "fruit_cell", for: indexPath) as! FruitItemTableViewCell
        
        cell.populate(fruit: fruitSearch[indexPath.row])
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fruitSearch = searchText.isEmpty ? fruits : fruits.filter({ (item: Fruit) -> Bool in
            
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
        
        tblFruits.reloadData()
    }
}
