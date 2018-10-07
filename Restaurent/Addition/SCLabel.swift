//
//  SCLabel.swift
//  Restaurant
//
//  Created by Scrupulous on 3/24/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class SCLabel: UILabel {

//    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
//        return self.bounds.insetBy(dx: CGFloat(15.0), dy: CGFloat(15.0))
//    }
//    
//    override func draw(_ rect: CGRect) {
//        super.drawText(in: self.bounds.insetBy(dx: CGFloat(5.0), dy: CGFloat(5.0)))
//    }
//    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.preferredMaxLayoutWidth = self.bounds.width;
        super.layoutSubviews()
    }
    

}
