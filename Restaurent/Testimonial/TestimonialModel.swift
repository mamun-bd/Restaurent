//
//  TestimoniaModel.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class TestimonialModel: NSObject {
    
    var name : String?
    var time : TimeInterval?
    var comment : String?
    var height : CGFloat?
    
    override init () {
        //super.init()
    }
    
    convenience init(withName name:String, withComment comment:String, withTime time:TimeInterval) {
        self.init()
        
        self.name = name;
        self.comment = comment;
        self.time = time;
    }
    

}
