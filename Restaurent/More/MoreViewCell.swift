//
//  MoreViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 4/3/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class MoreViewCell: UICollectionViewCell {

    @IBOutlet weak var lblName:UILabel!;
    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var container:UIView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.backgroundColor = UIColor.clear
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width/3, height:UIScreen.main.bounds.size.width/3);
        self.artworkContainer.layer.cornerRadius = self.artworkContainer.frame.size.width/2.0;
        self.artworkContainer.layer.masksToBounds = true;
        self.container.layer.cornerRadius = 5.0;
        self.container.layer.masksToBounds = true;
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        
        self.layoutIfNeeded()

    }

}
