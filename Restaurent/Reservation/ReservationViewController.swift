//
//  ReservationViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    class func initWithStoryboard() -> ReservationViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "ReservationViewControllerID") as! ReservationViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reservation"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

