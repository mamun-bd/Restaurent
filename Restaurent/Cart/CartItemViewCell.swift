//
//  CartItemViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 4/20/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class CartItemViewCell: UITableViewCell {
    
    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var lblTitle:UILabel!;
    @IBOutlet weak var lblWeight:UILabel!;
    @IBOutlet weak var lblPrice:UILabel!;
    @IBOutlet weak var btnIncreaseQuantity:UIButton!;
    @IBOutlet weak var lblQuantity:UILabel!;
    @IBOutlet weak var btnDecreaseQuantity:UIButton!;
    @IBOutlet weak var lblTotalPrice:UILabel!;
    
    var cartItem : VSCartModel?

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
    
    func setInformationOnView(withItem item:VSCartModel){
         self.cartItem = item;
         self.lblTitle.text = item.name
         self.lblPrice.text = item.price
         self.lblQuantity.text = "Quantity (\(item.quantity!))"
    }
    
    
    func getCalculatedHeight() -> CGFloat {
        
        self.container.setNeedsLayout()
        self.container.layoutIfNeeded()
        let cellHeight = self.container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight+5;
        
    }

    
}
