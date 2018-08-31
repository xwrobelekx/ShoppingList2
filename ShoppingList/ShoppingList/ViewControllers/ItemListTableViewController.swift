//
//  ItemListTableViewController.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit
import CoreData

class ItemListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
  
    
    //MARK: - Properties

    
    //MARK: - LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Fetched Result Controller
    let fetchedResultController : NSFetchedResultsController<Item> = {
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "produceName", ascending: true)]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
        
    }()
    
    
    
    
    
    
    



    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultController.fetchedObjects?.count ?? 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
  */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */




    
    
    //MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: Any) {

        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your list.", preferredStyle: .alert)
        alertController.addTextField { (produceNameTextField) in
            produceNameTextField.placeholder = "Produce Name"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let produceTextField = alertController.textFields?[0].text else {return}
            Item(produceName: produceTextField)
            CoreDataStack.saveToPersistentStore()
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
    }
    
    
    
    
    

}
