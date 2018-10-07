//
//  AboutViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    class func initWithStoryboard() -> AboutViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutViewControllerID") as! AboutViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "About Us"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

