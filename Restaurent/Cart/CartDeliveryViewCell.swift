//
//  CartDeliveryViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 4/20/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class CartDeliveryViewCell: UITableViewCell {
    
    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var deliveryOption:UISegmentedControl!;
    @IBOutlet weak var lblShipping:UILabel!;
    @IBOutlet weak var lblStorePickup:UILabel!;
    @IBOutlet weak var btnStorePickup:UIButton!;
    @IBOutlet weak var btnShippingAddress:UIButton!;
  

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:self.frame.size.height);
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        
        self.layoutIfNeeded()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setInformationOnView(withItem item:FavouriteModel){
        //        self.favourite = item;
        //        self.lblName.text = item.name
        //        self.lblDescription.text = item.artworkURL?.absoluteString
    }
    
    
    func getCalculatedHeight() -> CGFloat {
        
        self.container.setNeedsLayout()
        self.container.layoutIfNeeded()
        let cellHeight = self.container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight+5;
        
    }

    
}
