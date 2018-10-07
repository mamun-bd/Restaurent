//
//  ReceipeDetailsViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit



class ReceipeDetailsViewController: UIViewController {
    
    @IBOutlet weak var detailsTableView:UITableView!
    
    var informationCell : ReceipeInformationCell?
    var informationCellHeight : CGFloat?
    
    var selectedItem : MenuItemModel!
    
    
    class func initWithStoryboard(withReceipe reciepe:MenuItemModel) -> ReceipeDetailsViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "ReceipeDetailsViewControllerID") as! ReceipeDetailsViewController
        controller.selectedItem = reciepe
        return controller ;
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedItem.name
        self.informationCellHeight = 0.0
//        let addBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(sender:))) as UIBarButtonItem
//        self.navigationItem.setRightBarButton(addBarButton, animated: true)
        
//        self.detailsTableView.register(UINib(nibName: "ReceipeActivityCell", bundle:nil), forCellReuseIdentifier: "ReceipeActivityCellID");
        self.detailsTableView.register(UINib(nibName: "ReceipeCartCell", bundle:nil), forCellReuseIdentifier: "ReceipeCartCellID");
        self.detailsTableView.register(UINib(nibName: "ReceipeInformationCell", bundle:nil), forCellReuseIdentifier: "ReceipeInformationCellID");
        
        self.detailsTableView.separatorStyle = .none
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func calculateCellHeight() -> CGFloat {

        if (self.informationCellHeight == 0.0) {
            
            if (self.informationCell == nil) {
                self.informationCell = self.detailsTableView.dequeueReusableCell(withIdentifier: "ReceipeInformationCellID") as? ReceipeInformationCell;
            }
            
            //self.informationCell?.setInformationOnView(withItem: menu)
            self.informationCellHeight = self.informationCell?.getCalculatedHeight()
        }
        

        return self.informationCellHeight!;
        
    }
    
    @objc func addButtonTapped(sender: UIBarButtonItem) {
        
    }
    
    

    
}


extension ReceipeDetailsViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceipeInformationCellID", for: indexPath) as! ReceipeInformationCell
            cell.setInformationOnView(withItem: selectedItem)
            return cell
            
        }
//        else if indexPath.row == 1 {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceipeActivityCellID", for: indexPath) as! ReceipeActivityCell
//            return cell
//
//        }
        else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceipeCartCellID", for: indexPath) as! ReceipeCartCell
            cell.setInformationOnView(withItem: selectedItem)
            return cell
        
        }
      
     
    }
    
    
    
    
}

extension ReceipeDetailsViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        
        if indexPath.row == 0 {
            
            return calculateCellHeight();
            
        }
//        else if indexPath.row == 1 {
//
//            return 50.0;
//
//        }
        else {
            
           return 40.0;
            
        }
        
    }
    
}
