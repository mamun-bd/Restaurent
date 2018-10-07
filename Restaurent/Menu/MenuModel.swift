//
//  MenuModel.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class MenuModel: NSObject {
    
    var name : String?
    var identifier : String?
    var restaurentIdentifier : String?
    var height : CGFloat?
    var addedTime : String?
   
    
    override init () {
        //super.init()
    }

    convenience init(withInformation information:Dictionary<String, String>) {
        self.init()
        
        self.name = information["name"] ?? ""
        self.identifier = information["id"] ?? ""
        self.restaurentIdentifier = information["rest_id"] ?? ""
        self.addedTime = information["created_date"] ?? ""
   
    }
    

}
