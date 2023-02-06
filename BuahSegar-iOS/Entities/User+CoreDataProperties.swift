//
//  User+CoreDataProperties.swift
//  BuahSegar-iOS
//
//  Created by prk on 06/02/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var full_name: String?
    @NSManaged public var password: String?
    @NSManaged public var username: String?
    @NSManaged public var fav_fruits: NSSet?

}

// MARK: Generated accessors for fav_fruits
extension User {

    @objc(addFav_fruitsObject:)
    @NSManaged public func addToFav_fruits(_ value: FavFruit)

    @objc(removeFav_fruitsObject:)
    @NSManaged public func removeFromFav_fruits(_ value: FavFruit)

    @objc(addFav_fruits:)
    @NSManaged public func addToFav_fruits(_ values: NSSet)

    @objc(removeFav_fruits:)
    @NSManaged public func removeFromFav_fruits(_ values: NSSet)

}

extension User : Identifiable {

}
