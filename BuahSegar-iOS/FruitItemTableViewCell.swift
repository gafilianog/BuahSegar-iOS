//
//  FruitTableViewCell.swift
//  BuahSegar-iOS
//
//  Created by prk on 06/02/23.
//

import UIKit

class FruitItemTableViewCell: UITableViewCell {
    
    @IBOutlet var vFruitContainer: UIView!
    @IBOutlet var lblFruitName: UILabel!
    @IBOutlet var lblFruitOrder: UILabel!
    @IBOutlet var lblFruitFamily: UILabel!
    @IBOutlet var lblFruitGenus: UILabel!
    
    @IBOutlet var vNutritionContainer: UIView!
    @IBOutlet var lblCarb: UILabel!
    @IBOutlet var lblProtein: UILabel!
    @IBOutlet var lblFat: UILabel!
    @IBOutlet var lblCal: UILabel!
    @IBOutlet var lblSugar: UILabel!
    
    var fruitId = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(fruit: Fruit) {
        lblFruitName.text = fruit.name
        lblFruitOrder.text = fruit.order
        lblFruitFamily.text = fruit.family
        lblFruitGenus.text = fruit.genus
        
        lblCarb.text = "\(fruit.nutritions.carbohydrates)"
        lblProtein.text = "\(fruit.nutritions.protein)"
        lblFat.text = "\(fruit.nutritions.fat)"
        lblCal.text = "\(fruit.nutritions.calories)"
        lblSugar.text = "\(fruit.nutritions.sugar)"
        
        fruitId = fruit.id
        
        vFruitContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vFruitContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vFruitContainer.layer.shadowOpacity = 0.1
        vFruitContainer.layer.cornerRadius = 10
        
        vNutritionContainer.layer.cornerRadius = 10
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(fruitItemTapped(_:)))
        tapRecognizer.numberOfTapsRequired = 2
        vFruitContainer.isUserInteractionEnabled = true
        vFruitContainer.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func fruitItemTapped(_ sender: UITapGestureRecognizer) {
        
        let user = AppDelegate.currUser
        
        let favFruits = user.fav_fruits!.allObjects as! [FavFruit]
        
        for fav in favFruits {
            let favId = Int(fav.fruitId)
            
            if favId == fruitId {
                return
            }
        }
        
        let fav = FavFruit(context: AppDelegate.mCtx)
        
        fav.fruitId = Int32(fruitId)
        user.addToFav_fruits(fav)
        
        try! AppDelegate.mCtx.save()
    }
}
