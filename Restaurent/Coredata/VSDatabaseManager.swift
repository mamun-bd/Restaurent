//
//  VSDatabaseManager.swift
//  Scanner
//
//  Created by Scrupulous on 16/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//

import UIKit
import CoreData

class VSDatabaseManager {

    static let shared = VSDatabaseManager()
   
    var sourcePath:URL? {
        
        guard let sourceURL = Bundle.main.url(forResource: "Restaurent", withExtension: "momd") else { print("Error loading model from bundle")
              return .none

        }
        return sourceURL
    }
    
    var destPath:String? {
        
        guard sourcePath != .none else { return .none }
        let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        return (directory as NSString).appendingPathComponent("Restaurent.sqlite")
    
    }

    private lazy var mainManagedObjectContext: NSManagedObjectContext = {

        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        return moc
        
    }()
    
    private lazy var privateManagedObjectContext: NSManagedObjectContext = {
        
        let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        moc.parent = mainManagedObjectContext
        return moc
        
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: sourcePath!) else {
            fatalError("Error initializing mom from: \(sourcePath!)")
        }
        let psc = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        return psc
        
    }()
    
  
    private init() {
        
        let destination = destPath ?? ""
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: URL.init(fileURLWithPath: destination), options: nil)
        } catch {
            fatalError("Error migrating store: \(error)")
        }

        mainManagedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    deinit
    {
        do {
            try self.mainManagedObjectContext.save()
        } catch {
            fatalError("Error deinitializing main managed object context")
        }
    }
    
    func addUser(withUser information: SCUser, completionHandler: @escaping (SCUser?) -> Void)
    {
        
        VSDatabaseManager.shared.getManagedUser(forUserID: information.userID ?? "") { (managedUser) in
            
            self.privateManagedObjectContext.perform {
                do {
                    managedUser.firstname = information.firstname
                    managedUser.email = information.email
                    managedUser.userid = information.userID
                    managedUser.password = information.password
                    try self.privateManagedObjectContext.save()
                    try self.mainManagedObjectContext.save()
                    completionHandler(information)
                } catch {
                    completionHandler(nil)
                }
            }
            
        }
        
       
        
//        if (information.userID?.lengthOfBytes(using: String.Encoding.utf8))! > 0 {
//            
//            
//            
//        } else {
//            
//            
//            
//            
//        }
        
       
    }
    
    func getManagedUser(forUserID userID:String?, completionHandler: @escaping (User) -> Void)
    {
        
        privateManagedObjectContext.perform {
            do {
                let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "userid == %@", userID!)
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                
                if results.count > 0 {
                    completionHandler(results.first!)
                } else {
                    let managedUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.privateManagedObjectContext) as? User
                    completionHandler(managedUser!)
                }
                
            } catch {
                 let managedUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.privateManagedObjectContext) as? User
                completionHandler(managedUser!)
            }
        }
        
    }
  
    
    func addBarcode(withBarcode information: SCUser, completionHandler: @escaping (SCUser?) -> Void)
    {

        privateManagedObjectContext.perform {
            do {
                let managedUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.privateManagedObjectContext) as? User
                managedUser!.firstname = information.firstname
                managedUser!.email = information.email
                managedUser!.userid = information.userID
                try self.privateManagedObjectContext.save()
                try self.mainManagedObjectContext.save()
                completionHandler(information)
            } catch {
                completionHandler(nil)
            }
        }
    }

    func getBarcodeList(completionHandler: @escaping ([SCUser]) -> Void)
    {

        privateManagedObjectContext.perform {
            do {
                let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                let barcodes = results.map { $0.toUser() }
                completionHandler(barcodes)
            } catch {
                completionHandler([])
            }
        }

    }
    
    func getCurrentUser(completionHandler: @escaping (SCUser?) -> Void)
    {
        
        privateManagedObjectContext.perform {
            do {
                let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                let barcodes = results.map { $0.toUser() }
                if barcodes.count > 0 {
                    completionHandler(barcodes.first!)
                } else {
                    completionHandler(nil)
                }
            } catch {
                completionHandler(nil)
            }
        }
        
    }
    
    
    func addCartItem(withItem information: VSCartModel, completionHandler: @escaping (VSCartModel?) -> Void)
    {
//        VSDatabaseManager.shared.getCartManagedModel(forItemID: information.identifier) { (cartItem) in
        
            self.privateManagedObjectContext.perform {
                do {
                    
                    let cartItem = NSEntityDescription.insertNewObject(forEntityName: "Cart", into: self.privateManagedObjectContext) as? Cart
                    cartItem!.identifier = information.identifier
                    cartItem!.name = information.name
                    
//                    var previousQuantity:Int = Int(cartItem.quantity!)!
//                    previousQuantity = previousQuantity +
                    
                    cartItem!.quantity =  information.quantity
                    cartItem!.price = information.price
                    try self.privateManagedObjectContext.save()
                    try self.mainManagedObjectContext.save()
                    completionHandler(information)
                } catch {
                    completionHandler(nil)
                }
            }
            
//        }
        
    }
    
    func removeCartItem(withItem information: VSCartModel, completionHandler: @escaping (Bool) -> Void)
    {
        
        self.privateManagedObjectContext.perform {
            do {
                let fetchRequest : NSFetchRequest<Cart> = Cart.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "identifier == %@", information.identifier!)
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                
                if results.count > 0 {
                    
                    self.privateManagedObjectContext.delete(results.first!)
                    try self.privateManagedObjectContext.save()
                    try self.mainManagedObjectContext.save()
                  
                }
                
                 completionHandler(true)
                
            } catch {
               
                completionHandler(false)
            }
        }
        
    }
    
    
    func getCartManagedModel(forItemID itemID:String?, completionHandler: @escaping (Cart) -> Void)
    {
        
        self.privateManagedObjectContext.perform {
            do {
                let fetchRequest : NSFetchRequest<Cart> = Cart.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "identifier == %@", itemID!)
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                
                if results.count > 0 {
                    completionHandler(results.first!)
                } else {
                    let managedCart = NSEntityDescription.insertNewObject(forEntityName: "Cart", into: self.privateManagedObjectContext) as? Cart
                    completionHandler(managedCart!)
                }
                
            } catch {
                let managedCart = NSEntityDescription.insertNewObject(forEntityName: "Cart", into: self.privateManagedObjectContext) as? Cart
                completionHandler(managedCart!)
            }
        }
        
    }
    
    func getCartItemList(completionHandler: @escaping ([VSCartModel]) -> Void)
    {
        
        privateManagedObjectContext.perform {
            do {
                let fetchRequest : NSFetchRequest<Cart> = Cart.fetchRequest()
                let results = try self.privateManagedObjectContext.fetch(fetchRequest)
                let cartItems = results.map { $0.toCartModel() }
                completionHandler(cartItems)
            } catch {
                completionHandler([])
            }
        }
        
    }
    

}
