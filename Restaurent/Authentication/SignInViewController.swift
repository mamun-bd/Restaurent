//
//  SignInViewController.swift
//  Restaurant
//
//  Created by Scrupulous on 3/17/17.
//  Copyright © 2017 Scrupulous. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {



    class func initWithStoryboard() -> SignInViewController {
        
        let storyboard  = UIStoryboard(name: "Main", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignInViewControllerID") as! SignInViewController
        return controller ;
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Testimanial"
        
        VSDatabaseManager.shared.getCurrentUser { (user) in
            
            if user != nil {
                
                DispatchQueue.main.async {
                    let controller = SCTabBarController.initWithStoryboard()
                    self.present(controller, animated: true, completion: nil)
                }
                
            }
            
        }
        
    }
    
    @IBAction func signInButtonTapped(sender: UIButton) {
        
//        let user = SCUser.init(withName: "Johny", withEmail: "someone@rest.com", withUserID: "")
//        user.type = "owner"
//        user.password = "321654"
//
//        user.authenticate { (sucess, error) in
//
//            let controller = SCTabBarController.initWithStoryboard()
//            self.present(controller, animated: true, completion: nil)
//
//        }
        
        
        let user = SCUser.init(withName: "Scrupulous", withEmail: "surupulous@rest.com", withUserID: "")
        user.type = "user"
        user.password = "123456"
        user.lastname = "Soft"
        user.country = "UK"
        
//        user.register { (sucess, error) in
//              user.save()
//        }
        
        user.authenticate { (sucess, error) in

            user.save()
            let controller = SCTabBarController.initWithStoryboard()
            self.present(controller, animated: true, completion: nil)

        }

        
     
        
    }
    
   


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   


}



