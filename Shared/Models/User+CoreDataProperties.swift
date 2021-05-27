//
//  User+CoreDataProperties.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 25/05/21.
//
//

import Foundation
import CoreData

extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var initialDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var periodLength: Int16

}

extension User : Identifiable {}
