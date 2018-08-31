//
//  Item+Convenience.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation
import CoreData


extension Item {
    
    @discardableResult
    convenience init(produceName: String, isCompleted: Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        
        self.produceName = produceName
        self.isCompleted = isCompleted
    }
    
    
}
