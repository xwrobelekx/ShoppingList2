//
//  CoreDataStack.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import Foundation
import CoreData


enum CoreDataStack {
    static let container: NSPersistentContainer = {
        let appName = Bundle.main.object(forInfoDictionaryKey: (kCFBundleNameKey as String)) as! String
        let container = NSPersistentContainer(name: appName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
    
    static func saveToPersistentStore() {
        do{
            try CoreDataStack.context.save()
        }catch {
            print("There was an error on \(#function): \(error) \(error.localizedDescription)")
        }
    }
    
    static func delete(item: Item){
        CoreDataStack.context.delete(item)
        saveToPersistentStore()
    }
}
