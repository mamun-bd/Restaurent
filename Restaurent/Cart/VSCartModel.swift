//
//  VSCartModel.swift
//  Restaurent
//
//  Created by Scrupulous on 21/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit

class VSCartModel: NSObject {
    
    var identifier: String?
    var name: String?
    var price: String?
    var quantity: String?
   
    
    convenience init(withName name:String?, withId itemID: String?, withQuantity quantity: String?, withPrice price: String?) {
        self.init()
        self.name = name
        self.identifier = itemID
        self.quantity = quantity
        self.price = price
    }
    
    func save() {
        
        VSDatabaseManager.shared.addCartItem(withItem: self) { (cartItem) in
            
        }
        
    }
    
    func remove() {
        
        VSDatabaseManager.shared.removeCartItem(withItem: self) { (sucess) in
            
        }
        
    }
    
//    func getRequestParameters() -> String? {
//
//        let itemString = "item_name=\(name!),item_qty=\(quantity!),item_price=\(price!)"
//        return itemString
//
//    }
    
    func getRequestParameters1() -> Dictionary<String, Any> {
        
        let parameters = ["item_name": name!, "item_qty": quantity!, "item_price": price!] as Dictionary<String, Any>
        return parameters
        
    }
    
    

}
