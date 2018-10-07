//
//  MenuItemViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 3/24/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class MenuItemViewCell: UITableViewCell {

    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var lblName:UILabel!;

    var menu : MenuModel?
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
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
    
    func setInformationOnView(withItem item:MenuModel){
        self.menu = item;
        self.lblName.text = item.name
       
    }
   
    
    func getCalculatedHeight() -> CGFloat {

        self.container.setNeedsLayout()
        self.container.layoutIfNeeded()
        let cellHeight = self.container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight+5;
    
    }
    
}
