//
//  HomeViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var recentFoodContainer : RecentFoodCollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Restaurant"
        self.automaticallyAdjustsScrollViewInsets = false
        self.recentFoodContainer?.addItems(items: ["food_1.jpg", "food_2.jpg", "food_3.jpg", "food_4.jpg","food_5.jpg","food_6.jpg","food_7.jpg"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

