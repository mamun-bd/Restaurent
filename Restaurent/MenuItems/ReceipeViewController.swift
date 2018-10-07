//
//  ReceipeViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit



class ReceipeViewController: UIViewController {
    
    @IBOutlet weak var itemsTableView:UITableView!
    
    var itemCell : MenuItemModelViewCell?
    var itemList : NSMutableArray = []
    
    var selectedMenu : MenuModel!
    
    
    class func initWithStoryboard(withMenu menu:MenuModel) -> ReceipeViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "ReceipeViewControllerID") as! ReceipeViewController
        controller.selectedMenu = menu
        return controller ;
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.selectedMenu.name
        
        let addBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(sender:))) as UIBarButtonItem
        self.navigationItem.setRightBarButton(addBarButton, animated: true)
        
        let nibName = UINib(nibName: "MenuItemModelViewCell", bundle:nil)
        self.itemsTableView.register(nibName, forCellReuseIdentifier: "MenuItemModelViewCell");
        self.itemsTableView.separatorStyle = .none
        
        
        SCDataManager.sharedInstance.getMenuItemsInformation(forMenu: self.selectedMenu.identifier!) { (itemList, error) in
            
            if ((itemList?.count) != nil) {
                self.itemList.addObjects(from: itemList!)
                self.itemsTableView.reloadData()
            }
            
        }
      
        
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func calculateCellHeight(withItem menu:MenuItemModel) -> CGFloat {
        
        var height : CGFloat?
        
        if (menu.height == nil) {
            
            if (self.itemCell == nil) {
                self.itemCell = self.itemsTableView.dequeueReusableCell(withIdentifier: "MenuItemModelViewCell") as? MenuItemModelViewCell;
            }
            
            self.itemCell?.setInformationOnView(withItem: menu)
            menu.height = self.itemCell?.getCalculatedHeight()
        }
        
        height = menu.height
        
        return height!;
        
    }
    
    @objc func addButtonTapped(sender: UIBarButtonItem) {
        
    }
    
    
    func add(favourite item:MenuItemModel ) {
        
        self.getRestaurentInformation(forRestaurentID: "1")
        
        VSDatabaseManager.shared.getCurrentUser { (user) in
            
            let bodyData = String.init(format: "menu_id=%@&user_id=%@",(item.identifier)!,(user?.userID)!)
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
    
    
    func getRestaurentInformation(forRestaurentID restaurentID:String ) {
        
            let loginAPIURL = String.init(format: "http://dev.saifthegreen.com/restaurant/admin/get_restaurant_info/%@",restaurentID)
        
            SCDataManager.sharedInstance.sendGetRequest(withURL: loginAPIURL) { (information, error) in
                
                DispatchQueue.main.async {
                    
                    if (information == nil){
                    } else {
                        
                    }
                    
                }
                
                
                
            }
            
            
        
        
    }
    
}


extension ReceipeViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemModelViewCell", for: indexPath) as! MenuItemModelViewCell
        let selectedMenu  = self.itemList[indexPath.row];
        cell.setInformationOnView(withItem: selectedMenu as! MenuItemModel)
        
        return cell
    }
    
    
    
    
}

extension ReceipeViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        let selectedMenu  = self.itemList[indexPath.row];
        return calculateCellHeight(withItem: selectedMenu as! MenuItemModel)
        
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    

            let selectedMenu  = self.itemList[indexPath.row] as? MenuItemModel;
            
            let controller = ReceipeDetailsViewController.initWithStoryboard(withReceipe: selectedMenu!)
            self.navigationController?.pushViewController(controller, animated: true)
            self.itemsTableView .deselectRow(at: indexPath, animated: false);
            
            
            
//            
//            self.add(favourite: selectedMenu!)
          
            
            
            
            
            
            
            
            
           
            
            
            
            
//            let cartItem = selectedMenu?.getCartModel()
//            cartItem?.save()
            
//             let selectedMenu2  = self.itemList[indexPath.row+1] as? MenuItemModel;
//
//            let items : NSMutableArray = []
//            items.add(selectedMenu!.getRequestParameters()!)
//            items.add(selectedMenu2!.getRequestParameters()!)
//
//
//            let orderItems : NSMutableArray = []
//
//            for itemIndex in 1...2 {
//                print("RTY")
//
//                let itemInformation = items.object(at: (itemIndex-1))
//
//               //  let parameters =  "item_\(itemIndex)=\(itemInformation)"
//
//
//                let parameters1 = String.init(format: "item_%d=[%@]",itemIndex,itemInformation as! CVarArg)
//                orderItems.add(parameters1)
//
//            }
//
////           let item1 = String.init(format: "item_name=%@&item_qty=4&item_price=%@",(selectedMenu?.name!)!,(selectedMenu?.price!)!)
////
////            let parameters = String.init(format: "item1=%@",item1)
////
////
////            items.add(parameters)
////            items.add(parameters)
//
//
//
//
//            let bodyData = String.init(format: "transaction_id=55&customer_id=11&tot_price=77.00&ordersDetails=%@",orderItems)
//
//            //request.httpBody = bodyData.data(using: String.Encoding.utf8);
//
//            SCDataManager.sharedInstance.placeOrderData(urlString: "http://dev.saifthegreen.com/restaurant/admin/make_order", orderInformation: bodyData as String) { (orderInformation, error) in
//
//
//
//            }
//
          
            
            
        }
    
    
    
}
