//
//  ReceipeCartCell.swift
//  Restaurant
//
//  Created by Scrupulous on 4/20/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class ReceipeCartCell: UITableViewCell {

     var selectedItem : MenuItemModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInformationOnView(withItem item:MenuItemModel){
        self.selectedItem = item;
      
    }
    
    @IBAction func addCartAction(_ sender: Any) {
        let cartItem = self.selectedItem?.getCartModel()
        cartItem?.save()
        
    }
    
}
