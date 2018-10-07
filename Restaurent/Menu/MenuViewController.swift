//
//  MenuViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit


class MenuViewController: UIViewController {
    
   
    @IBOutlet weak var menuTableView:UITableView!
    
    var menuCell : MenuItemViewCell?
    var menuList : NSMutableArray = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Menu"
        
        let addBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(sender:))) as UIBarButtonItem
        let cartBarButton = UIBarButtonItem.init(barButtonSystemItem: .compose, target: self, action: #selector(cartButtonTapped(sender:))) as UIBarButtonItem
        self.navigationItem.setRightBarButtonItems([addBarButton,cartBarButton], animated: true)
        
   
        let nibName = UINib(nibName: "MenuItemViewCell", bundle:nil)
        self.menuTableView.register(nibName, forCellReuseIdentifier: "MenuItemViewCell");
        self.menuTableView.separatorStyle = .none
        self.menuTableView.estimatedRowHeight = 44
        self.menuTableView.rowHeight = UITableView.automaticDimension
        
        
        SCDataManager.sharedInstance.getMenuListInformation { (itemList, error) in
            
            if ((itemList?.count) != nil) {
                self.menuList.addObjects(from: itemList!)
                self.menuTableView.reloadData()
            }
            
        }
        
        
      
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func addButtonTapped(sender: UIBarButtonItem) {
        
    }
    
    @objc func cartButtonTapped(sender: UIBarButtonItem) {
        
        let controller = CartViewController.initWithStoryboard()
        self.navigationController?.pushViewController(controller, animated: true)
    
    }
    
    

}


extension MenuViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuList.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemViewCell", for: indexPath) as! MenuItemViewCell
        let selectedMenu  = self.menuList[indexPath.row];
        cell.setInformationOnView(withItem: selectedMenu as! MenuModel)
        
        return cell
    }
    
}

extension MenuViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
        let selectedMenu  = self.menuList[indexPath.row];
        let controller = ReceipeViewController.initWithStoryboard(withMenu: selectedMenu as! MenuModel)
        self.navigationController?.pushViewController(controller, animated: true)
        self.menuTableView .deselectRow(at: indexPath, animated: false);
    
    }
    
}

