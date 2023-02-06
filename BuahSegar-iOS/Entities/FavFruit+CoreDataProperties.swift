//
//  FavFruit+CoreDataProperties.swift
//  BuahSegar-iOS
//
//  Created by prk on 06/02/23.
//
//

import Foundation
import CoreData


extension FavFruit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavFruit> {
        return NSFetchRequest<FavFruit>(entityName: "FavFruit")
    }

    @NSManaged public var fruitId: Int32
    @NSManaged public var user: User?

}

extension FavFruit : Identifiable {

}
