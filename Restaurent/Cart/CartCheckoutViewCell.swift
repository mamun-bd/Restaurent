//
//  CartCheckoutViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 4/20/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class CartCheckoutViewCell: UITableViewCell {

    
    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var checkOut:UISegmentedControl!;
    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var lblPrice:UILabel!;
    @IBOutlet weak var lblDate:UILabel!;
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
