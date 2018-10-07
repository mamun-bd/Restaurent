//
//  LocationViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {

    class func initWithStoryboard() -> LocationViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "LocationViewControllerID") as! LocationViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Location"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

