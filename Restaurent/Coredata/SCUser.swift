//
//  SCUser.swift
//  Restaurant
//
//  Created by Scrupulous on 21/9/18.
//  Copyright © 2018 Scrupulous. All rights reserved.
//

import UIKit

class SCUser: NSObject {

    var userID: String?
    var firstname: String?
    var password: String?
    var type: String?
    var lastname: String?
    var country: String?
    var email: String?
    
    convenience init(withName name:String?, withEmail email: String?, withUserID indentifier: String?) {
        self.init()
        self.firstname = name
        self.email = email
        self.userID = indentifier
    }
    
  
    
    func authenticate(completion: @escaping (Bool,NSError?) ->Void ){
        
        let bodyData = String.init(format: "user_mail=%@&user_pass=%@&type=%@",email!,password!,type!)
        let loginAPIURL = "http://dev.saifthegreen.com/restaurant/admin/user_login"

        SCDataManager.sharedInstance.sendRequest(withURL: loginAPIURL, withInformation: bodyData) { (information, error) in
            
            DispatchQueue.main.async {

                if (information == nil){
                    completion (false,error)
                } else {
                    self.userID = (information!["userID"] as! String)
                    completion (true,nil)
                }
                
            }
            
          
            
        }
        
    }
    
    
    func register(completion: @escaping (Bool,NSError?) ->Void ){
        
        let bodyData = String.init(format: "type=%@&first_name=%@&last_name=%@&country=%@&email=%@&password=%@",type!,firstname!,lastname!,country!,email!,password!)
        let loginAPIURL = "http://dev.saifthegreen.com/restaurant/admin/register_user"
        
        SCDataManager.sharedInstance.sendRequest(withURL: loginAPIURL, withInformation: bodyData) { (information, error) in
            
            DispatchQueue.main.async {
                
                if (information == nil){
                    completion (false,error)
                } else {
                    //self.userID = (information!["userID"] as! String)
                    completion (true,nil)
                }
                
            }
            
        }
        
    }
    
    func save() {
        
        VSDatabaseManager.shared.addUser(withUser: self) { (user) in
            
            
        }
        
    }
    
  
    
}
