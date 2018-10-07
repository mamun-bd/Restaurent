//
//  OrderModel.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

let kOrderId = "order_id"
let kOrderPrice = "total_price"
let kOrderDate = "order_date"
let kOrderTransactionID = "transaction_id"
let kOrderDetails = "order_details"

class OrderModel: NSObject {
    
    var orderId : String?
    var orderPrice : String?
    var orderDate : String?
    var transactionID : String?
   
    override init () {
        //super.init()
    }
    
    convenience init(withInformation information:NSDictionary) {
        self.init()
        
        self.orderId = information.value(forKey: kOrderId) as? String;
        self.orderPrice = information.value(forKey: kOrderPrice) as? String
        self.orderDate = information.value(forKey: kOrderDate) as? String
        self.transactionID = information.value(forKey: kOrderTransactionID) as? String
    }

}
