//
//  FavouriteViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class FavouriteViewCell: UITableViewCell {

    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var lblName:UILabel!;
    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var lblDescription:UILabel!;
    
    var favourite : FavouriteModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:self.frame.size.height);
        self.artworkContainer.layer.cornerRadius = self.artworkContainer.frame.size.width/2.0;
        self.artworkContainer.layer.masksToBounds = true;
        self.container.layer.cornerRadius = 5.0;
        self.container.layer.masksToBounds = true;
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        
        self.layoutIfNeeded()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setInformationOnView(withItem item:FavouriteModel){
        self.favourite = item;
        self.lblName.text = item.name
        self.lblDescription.text = item.artworkURL?.absoluteString
    }
    
    
    func getCalculatedHeight() -> CGFloat {
        
        self.container.setNeedsLayout()
        self.container.layoutIfNeeded()
        let cellHeight = self.container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight+5;
        
    }

    
}
