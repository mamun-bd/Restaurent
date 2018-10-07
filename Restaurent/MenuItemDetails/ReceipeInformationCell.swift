//
//  ReceipeInformationCell.swift
//  Restaurant
//
//  Created by Scrupulous on 4/20/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class ReceipeInformationCell: UITableViewCell {

    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var lblDescription:SCLabel!;
    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var lblPrice:UILabel!;
    @IBOutlet weak var lblWeight:UILabel!;
    @IBOutlet weak var lblLike:UILabel!;
    
     var selectedItem : MenuItemModel?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:self.frame.size.height);
        self.setNeedsLayout()
        self.needsUpdateConstraints()
         self.selectionStyle = .none
        self.layoutIfNeeded()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setInformationOnView(withItem item:MenuItemModel){
        self.selectedItem = item;
        self.lblWeight.text = item.quantity
        self.lblPrice.text = item.price?.description
       // self.lblDescription.text = item.details
    }
    
    
    func getCalculatedHeight() -> CGFloat {
        
        self.container.setNeedsLayout()
        self.container.layoutIfNeeded()
        let cellHeight = self.container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight+5;
        
    }
    
    @IBAction func addToFavouriteAction(_ sender: Any) {
       
        VSDatabaseManager.shared.getCurrentUser { (user) in
            
            let bodyData = String.init(format: "menu_id=%@&user_id=%@",(self.selectedItem!.identifier)!,(user?.userID)!)
            let loginAPIURL = "http://dev.saifthegreen.com/restaurant/admin/make_favorite"
            
            SCDataManager.sharedInstance.sendRequest(withURL: loginAPIURL, withInformation: bodyData) { (information, error) in
                
                DispatchQueue.main.async {
                    
                    if (information == nil){
                    } else {
                        
                    }
                    
                }
                
                
                
            }
            
            
        }
        
        
    }
   

    
}
