//
//  FavouriteModel.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class FavouriteModel: NSObject {

    var name : String?
    var price : CGFloat?
    var artworkURL : NSURL?
    var numberOfLike : NSNumber?
    var numberOfComment : NSNumber?
    var isFavourite : Bool?
    var height : CGFloat?
    
    override init () {
        //super.init()
    }
    
    convenience init(forName name:String, forDetails detail:String) {
        self.init()
        
        self.name = name;
        self.artworkURL = NSURL.fileURL(withPath: detail) as NSURL;
    }
}
