//
//  SCDataManager.swift
//  Restaurant
//
//  Created by Scrupulous on 11/1/18.
//  Copyright © 2018 Scrupulous. All rights reserved.
//

import UIKit

class SCDataManager: NSObject {
    
    static let sharedInstance = SCDataManager()
    private override init() {}
    
    
    func getMenuListInformation(completion: @escaping (Array<Any>?,NSError?) ->Void ) {
        
        
        self.fetchData(urlString:"http://dev.saifthegreen.com/restaurant/admin/get_menu_cats") { (responseDict, error) in
            
            let menuList : NSMutableArray = []
            
            let data1 = responseDict?["cats"] as? [Dictionary<String,AnyObject>]
            if let data = data1 {
                
                for(_, value) in data.enumerated() {
                    
                    let menu = MenuModel.init(withInformation: value as! Dictionary<String, String>)
                    menuList.add(menu)
                    
                }
                
                DispatchQueue.main.async {
                     return completion(menuList as! Array<MenuModel>,nil)
                }
                
                
                
            } else {
                DispatchQueue.main.async {
                    return completion(menuList as! Array<MenuModel>,nil)
                }
            }
            
            
        }
        
    }
    
    func getOrderListInformation(withUserID userID:String?, completion: @escaping (Array<Any>?,NSError?) ->Void ) {
        
        
        let url = "http://dev.saifthegreen.com/restaurant/admin/get_orders/\(userID!)"
        
        self.fetchData(urlString:url) { (responseDict, error) in
            
            let orderList : NSMutableArray = []
            
            let data1 = responseDict?["orders"] as? [Dictionary<String,AnyObject>]
            if let data = data1 {
                
                for(_, value) in data.enumerated() {
                    
                    let menu = OrderModel.init(withInformation: value as NSDictionary)
                    orderList.add(menu)
                    
                }
                
                DispatchQueue.main.async {
                    return completion(orderList as! Array<OrderModel>,nil)
                }
                
                
                
            } else {
                DispatchQueue.main.async {
                    return completion(orderList as! Array<OrderModel>,nil)
                }
            }
            
            
        }
        
    }
    
    
    func getMenuItemsInformation(forMenu categoryId: String, completion: @escaping (Array<Any>?,NSError?) ->Void ) {
        
        var urlString = "http://dev.saifthegreen.com/restaurant/admin/get_all_menus/"
        urlString.append(categoryId)
        
        self.fetchData(urlString:urlString) { (responseDict, error) in
            
            let menuItemList : NSMutableArray = []
            
            let data1 = responseDict?["menus"] as? [Dictionary<String,AnyObject>]
            if let data = data1 {
                
                for(_, value) in data.enumerated() {
                    
                    let menuItem = MenuItemModel.init(withInformation: value as! Dictionary<String, String>);
                    menuItemList.add(menuItem)
                    
                }
                
                DispatchQueue.main.async {
                    return completion(menuItemList as! Array<MenuItemModel>,nil)
                }
                
                
                
            } else {
                DispatchQueue.main.async {
                    return completion(menuItemList as! Array<MenuItemModel>,nil)
                }
            }
            
            
        }
        
    }

    
    func fetchData(urlString : String, completion: @escaping (NSDictionary?,NSError?) ->Void ){
        let sharedSession = URLSession.shared
        if let url = URL(string: urlString) {
            
            var request = URLRequest(url: url as URL)
            request.httpMethod = "GET"
            
            let task = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) in
                
                if error == nil && data != nil {
                    
                    do {
                        
                        if let responseJSON : AnyObject = try
                            
                            JSONSerialization.jsonObject(with: data!, options: []) as AnyObject {
                            
                            if responseJSON is NSDictionary{
                                completion(responseJSON as? NSDictionary,nil)
                            }else{
                                let dict : NSDictionary = ["data":responseJSON as Any]
                                completion(dict,nil)
                            }
                            
                        } else {
                            completion(nil,nil)
                            
                        }
                        
                    }catch{
                        completion(nil,NSError(domain: "HttpResponseErrorDomain", code: 401, userInfo: nil))
                    }
                    
                    
                }else{
                    //fail
                    
                    completion(nil,NSError(domain: "HttpResponseErrorDomain", code: 123, userInfo: nil))
                    
                    
                }
                
                
            })
            
            task.resume()
        }
        
    }
    

    func placeOrderData(urlString : String, orderInformation : String?, completion: @escaping (NSDictionary?,NSError?) ->Void ){
        
        let sharedSession = URLSession.shared
        
        if let url = URL(string: urlString) {
            
            var request = URLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.httpBody = orderInformation!.data(using: String.Encoding.utf8);
        
            let task = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        completion(json as NSDictionary,nil)
                    }
                } catch let error {
                    completion(nil,error as NSError)
                }
               
            })
            
            task.resume()
        }
        
    }
    
   
    
    func sendRequest(withURL url: String, withInformation information: String, completion: @escaping (NSDictionary?,NSError?) ->Void ){
        
        let sharedSession = URLSession.shared
        
        if let url = URL(string: url) {
            
            var request = URLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.httpBody = information.data(using: String.Encoding.utf8);
            
        
            let task = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] {
                        
                        print(json)
                        completion(json as NSDictionary,nil)

                        
                    }
                } catch let error {
                    print(error.localizedDescription)
                    completion(nil,error as NSError)

                }
             
                
            })
            
            task.resume()
        }
        
    }
    
    func sendGetRequest(withURL url: String, completion: @escaping (NSDictionary?,NSError?) ->Void ){
        
        let sharedSession = URLSession.shared
        
        if let url = URL(string: url) {
            
            var request = URLRequest(url: url as URL)
            request.httpMethod = "GET"
          
            let task = sharedSession.dataTask(with: request, completionHandler: { (data, response, error) in
                
                guard error == nil else {
                    return
                }
                
                guard let data = data else {
                    return
                }
                
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String : Any] {
                        
                        print(json)
                        completion(json as NSDictionary,nil)
                        
                        
                    }
                } catch let error {
                    print(error.localizedDescription)
                    completion(nil,error as NSError)
                    
                }
                
                
            })
            
            task.resume()
        }
        
    }


}


//            do {
//                request.httpBody = try JSONSerialization.data(withJSONObject: orderInformation, options: .prettyPrinted)
//
////                let jsonData = try! JSONSerialization.data(withJSONObject: orderInformation, options: .prettyPrinted)
////              //  request.httpBody = jsonData
////
////                if let jsonString = String(data: jsonData, encoding: .utf8) {
////                    print(jsonString)
////
////                     request.httpBody = jsonString.data(using: String.Encoding.utf8);
////
////                }
//
//
//            } catch let error {
//                 print(error.localizedDescription)
//            }

//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            request.addValue("application/json", forHTTPHeaderField: "Accept")
