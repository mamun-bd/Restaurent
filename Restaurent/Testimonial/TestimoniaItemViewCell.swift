//
//  TestimoniaItemViewCell.swift
//  Restaurant
//
//  Created by Scrupulous on 3/24/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class TestimoniaItemViewCell: UITableViewCell {

    @IBOutlet weak var container:UIView!;
    @IBOutlet weak var lblName:UILabel!;
    @IBOutlet weak var lblTime:UILabel!;
    @IBOutlet weak var artworkContainer:UIImageView!;
    @IBOutlet weak var lblDescription:UILabel!;
    
    var testimonial : TestimonialModel?
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.clear
        self.frame = CGRect(x:self.frame.origin.x, y:self.frame.origin.y, width:UIScreen.main.bounds.size.width, height:self.frame.size.height);
        self.artworkContainer.layer.cornerRadius = self.artworkContainer.frame.size.width/2.0;
        self.artworkContainer.layer.masksToBounds = true;
        
        self.container.layer.cornerRadius = 5.0;
        self.container.layer.masksToBounds = true;
        
        self.setNeedsLayout()
        self.needsUpdateConstraints()
        
        self.layoutIfNeeded()
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInformationOnView(withItem item:TestimonialModel){
        self.testimonial = item;
        self.lblName.text = item.name
        self.lblDescription.text = item.comment
        self.lblTime.text = item.time?.timeIntervalAsString("dd days, hh hours, mm minutes ago")
    }
   
    
    func getCalculatedHeight() -> CGFloat {

        self.container.setNeedsLayout()
        self.container.layoutIfNeeded()
        let cellHeight = self.container.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return cellHeight+5;
    
    }
    
    
}

extension TimeInterval {
    func timeIntervalAsString(_ format : String) -> String {
        var asInt   = NSInteger(self)
        let ago = (asInt < 0)
        if (ago) {
            asInt = -asInt
        }
        let ms = Int(self.truncatingRemainder(dividingBy: 1) * (ago ? -1000 : 1000))
        let s = asInt % 60
        let m = (asInt / 60) % 60
        let h = ((asInt / 3600))%24
        let d = (asInt / 86400)
        
        var value = format
        value = value.replacingOccurrences(of: "hh", with: String(format: "%0.2d", h))
        value = value.replacingOccurrences(of: "mm",  with: String(format: "%0.2d", m))
        value = value.replacingOccurrences(of: "sss", with: String(format: "%0.3d", ms))
        value = value.replacingOccurrences(of: "ss",  with: String(format: "%0.2d", s))
        value = value.replacingOccurrences(of: "dd",  with: String(format: "%d", d))
        if (ago) {
            value += " ago"
        }
        return value
    }
    
}

