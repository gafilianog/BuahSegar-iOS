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
        
        vFruitContainer.layer.shadowColor = UIColor.lightGray.cgColor
        vFruitContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        vFruitContainer.layer.shadowOpacity = 0.1
        vFruitContainer.layer.cornerRadius = 10
        
        vNutritionContainer.layer.cornerRadius = 10
    }
}
