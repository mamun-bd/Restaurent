//
//  UIStoryboard+Addition.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func getMainStoryboard() -> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: Bundle.main)
    }

}
