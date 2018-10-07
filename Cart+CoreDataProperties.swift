//
//  Cart+CoreDataProperties.swift
//  Restaurent
//
//  Created by Scrupulous on 21/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var identifier: String?
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var quantity: String?

}
