//
//  CartViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/31/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit



class CartViewController: UIViewController {
    
    @IBOutlet weak var cartTableView:UITableView!
    
     var itemList : NSMutableArray = []
    
    var informationCell : ReceipeInformationCell?
    var informationCellHeight : CGFloat?
    
    var selectedMenu : MenuModel!
    
    
    class func initWithStoryboard() -> CartViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "CartViewControllerID") as! CartViewController
        return controller ;
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cart"
        self.informationCellHeight = 0.0
        let addBarButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(sender:))) as UIBarButtonItem
        self.navigationItem.setRightBarButton(addBarButton, animated: true)
        
        self.cartTableView.register(UINib(nibName: "CartItemViewCell", bundle:nil), forCellReuseIdentifier: "CartItemViewCellID");
        self.cartTableView.register(UINib(nibName: "CartDeliveryViewCell", bundle:nil), forCellReuseIdentifier: "CartDeliveryViewCellID");
        self.cartTableView.register(UINib(nibName: "CartCheckoutViewCell", bundle:nil), forCellReuseIdentifier: "CartCheckoutViewCellID");
        
        self.cartTableView.separatorStyle = .none
        self.cartTableView.estimatedRowHeight = 44
        self.cartTableView.rowHeight = UITableView.automaticDimension
        self.initializeDatasource()
      
        
    }
    
    func initializeDatasource() {
        self.itemList.removeAllObjects()
        VSDatabaseManager.shared.getCartItemList { (items) in
            
            DispatchQueue.main.async {
                self.itemList.addObjects(from: items)
                self.cartTableView.reloadData()
            }
            
            
        }
    }
    
    
    @objc func addButtonTapped(sender: UIBarButtonItem) {
    
        var items = [String: Any]()
        var itemIndex : Int = 1
        for cartItem in self.itemList {
            let item  = cartItem as? VSCartModel;
            let keys = String.init(format: "item_%d",itemIndex)
            items[keys] = (item?.getRequestParameters1())!
            itemIndex = itemIndex + 1
        }

        
        let jsonData = try! JSONSerialization.data(withJSONObject: items, options: .prettyPrinted)
        let jsonString = String(data: jsonData, encoding: .utf8)
        let bodyData = String.init(format: "transaction_id=55&customer_id=11&tot_price=77.00&order_details=%@",jsonString!)
        

        SCDataManager.sharedInstance.placeOrderData(urlString: "http://dev.saifthegreen.com/restaurant/admin/make_order", orderInformation: bodyData) { (orderInformation, error) in
            
            if error == nil {
                
                DispatchQueue.main.async {
                    
                    for cartItem in self.itemList {
                        let item  = cartItem as? VSCartModel;
                        item?.remove()
                    }
                    
                    self.itemList.removeAllObjects()
                    self.cartTableView.reloadData()

                    
                }
                
            }
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension CartViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemViewCellID", for: indexPath) as! CartItemViewCell
        let selectedCart  = self.itemList[indexPath.row];
        cell.setInformationOnView(withItem: selectedCart as! VSCartModel)
        return cell
      
    }
    
    
    
    
}

extension CartViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{

        return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let selectedCart  = self.itemList[indexPath.row] as! VSCartModel;
            selectedCart.remove()
            self.itemList.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }

    
}
