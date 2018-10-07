//
//  Cart+CoreDataClass.swift
//  Restaurent
//
//  Created by Scrupulous on 21/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cart)
public class Cart: NSManagedObject {

    func toCartModel() -> VSCartModel
    {
        return VSCartModel.init(withName: name, withId: identifier, withQuantity: quantity, withPrice: price)
    }
    
}
