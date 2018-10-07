//
//  User+CoreDataProperties.swift
//  Restaurent
//
//  Created by Scrupulous on 21/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var userid: String?
    @NSManaged public var usertype: String?
    @NSManaged public var firstname: String?
    @NSManaged public var lastname: String?
    @NSManaged public var email: String?
    @NSManaged public var country: String?
    @NSManaged public var password: String?

}
