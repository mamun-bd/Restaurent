//
//  MenuItemModel.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class MenuItemModel: NSObject {

    var name : String?
    var identifier : String?
    var details : String?
    var price : String?
    var iconURL : String?
    var categoryId : String?
    var isFavourite : Bool?
    var height : CGFloat?
    var addedTime : String?
    var quantity : String?
    

    override init () {
        //super.init()
    }
    
    
    convenience init(withInformation information:Dictionary<String, Any>) {
        self.init()
        
        self.name = information["name"] as? String
        self.identifier = information["id"] as? String
        self.details = information["details"] as? String
        
        self.price = information["price"] as? String
        self.categoryId = information["cat_id"] as? String
        self.addedTime = information["created_date"] as? String
        self.iconURL = information["icon"] as? String
        self.quantity = information["qty"] as? String
        
    }
    
    func getRequestParameters() -> String? {
        
//        let itemInformation : NSMutableArray = []
//        itemInformation.add("item_name=\(name!)")
//         itemInformation.add("item_qty=\(quantity!)")
//         itemInformation.add("item_price=\(price!)")
        
        let itemString = "item_name=\(name!),item_qty=\(quantity!),item_price=\(price!)"
        return itemString
        
    }
    
    func getCartModel() -> VSCartModel? {
        
        let cartItem = VSCartModel.init(withName: name, withId: identifier, withQuantity: quantity, withPrice: price)
        return cartItem
        
    }
    

}
