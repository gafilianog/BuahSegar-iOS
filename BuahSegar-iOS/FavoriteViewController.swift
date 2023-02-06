//
//  FavoriteViewController.swift
//  BuahSegar-iOS
//
//  Created by prk on 06/02/23.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tblFavFruit: UITableView!
    
    let env = Bundle.main.infoDictionary! ["BUAH_SEGAR_API_ENDPOINT"] as! String
    
    var fruits = [Fruit]()
    var favId = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblFavFruit.dataSource = self
        
        refreshFavorites()
    }
    
    func refreshFavorites() {
        fruits = []
        
        let user = AppDelegate.currUser
        
        let favFruits = user.fav_fruits!.allObjects as! [FavFruit]
        
        for fav in favFruits {
            favId = Int(fav.fruitId)
            
            let url = URL(string: env + "/\(favId)")!
            
            var req = URLRequest(url: url)
            req.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: req) { data, _, err in
                if let err = err {
                    print(err)
                    return
                }
                
                let resFruit = try! JSONDecoder().decode(Fruit.self, from: data!)
                
                DispatchQueue.main.async {
                    self.fruits.append(resFruit)
                    
                    self.tblFavFruit.reloadData()
                }
            }.resume()
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        refreshFavorites()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblFavFruit.dequeueReusableCell(withIdentifier: "fav_fruit_cell", for: indexPath) as! FruitItemTableViewCell
        
        cell.populate(fruit: fruits[indexPath.row])
        
        return cell
    }
}
