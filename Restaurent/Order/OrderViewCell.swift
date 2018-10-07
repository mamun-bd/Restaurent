//
//  OrderViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit


let kOrderCellHeight = 60.0

class OrderViewCell: UITableViewCell {

    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var lblTitle:UILabel!;
    @IBOutlet weak var lblPrice:UILabel!;
    @IBOutlet weak var lblDate:UILabel!;
    
    var order : OrderModel?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:self.frame.size.height);
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
    
    func setInformationOnView(withItem item:OrderModel){
        self.order = item;
        self.lblTitle.text = "Order ID:\(item.orderDate!)"
        self.lblPrice.text = item.orderPrice!
        self.lblDate.text = item.orderDate!
    
    }
    
    
    func getCalculatedHeight() -> CGFloat {
        
        return CGFloat(kOrderCellHeight+5);
        
    }
    
}
