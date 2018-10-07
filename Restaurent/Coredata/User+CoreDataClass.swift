//
//  User+CoreDataClass.swift
//  Restaurent
//
//  Created by Scrupulous on 21/9/18.
//  Copyright © 2018 Md. Mamun-Ur-Rashid. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    func toUser() -> SCUser
    {
        return SCUser.init(withName: firstname, withEmail: email, withUserID: userid)
    }

}
