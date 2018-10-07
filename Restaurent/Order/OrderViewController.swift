//
//  OrderViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var orderTableView:UITableView!
    
    var orderCell : OrderViewCell?
    var orderList : NSMutableArray = []
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Order"
        
        let nibName = UINib(nibName: "OrderViewCell", bundle:nil)
        self.orderTableView.register(nibName, forCellReuseIdentifier: "OrderViewCell");
        self.orderTableView.separatorStyle = .none
        self.orderTableView.estimatedRowHeight = 44
        self.orderTableView.rowHeight = UITableView.automaticDimension
        
        self.initializeDatasource()
        
    }
    
    func initializeDatasource() {
        
        self.orderList.removeAllObjects()
        
        VSDatabaseManager.shared.getCurrentUser { (user) in
           
            SCDataManager.sharedInstance.getOrderListInformation(withUserID: user?.userID) { (itemList, error) in
                
                DispatchQueue.main.async {
                    
                    if ((itemList?.count) != nil) {
                        self.orderList.addObjects(from: itemList!)
                        self.orderTableView.reloadData()
                    }
                    
                }

                
            }

            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension OrderViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderList.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderViewCell", for: indexPath) as! OrderViewCell
        let selectedOrder  = self.orderList[indexPath.row];
        cell.setInformationOnView(withItem: selectedOrder as! OrderModel)
        
        return cell
    }
    
    
    
    
    
}

extension OrderViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
    
        return UITableView.automaticDimension
    
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.orderList.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .none)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        
        let controller = CartViewController.initWithStoryboard()
        self.navigationController?.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: false);
        
        
    }
}

