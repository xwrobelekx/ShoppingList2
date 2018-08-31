//
//  ItemListTableViewController.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit
import CoreData

class ItemListTableViewController: UITableViewController,NSFetchedResultsControllerDelegate, ItemTableViewDelegate {
    
    //MARK: - LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultController.delegate = self
        do{
            try fetchedResultController.performFetch()
        } catch {
            print("There was an error on \(#function): \(error) \(error.localizedDescription)")
        }
    }
    
    //MARK: - Fetched Result Controller
    let fetchedResultController : NSFetchedResultsController<Item> = {
        let fetchRequest : NSFetchRequest<Item> = Item.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "produceName", ascending: true)]
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }()
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .delete:
            guard let indexPath = indexPath else {return}
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case.insert:
            guard let indexPath = newIndexPath else {return}
            tableView.insertRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath,
                let newIndexPath = newIndexPath else {return}
            tableView.moveRow(at: indexPath, to: newIndexPath)
        case .update:
            guard let indexPath = indexPath else {return}
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    //MARK: - Methods
    func completeButtonTapped(cell: ItemTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        guard let item = fetchedResultController.fetchedObjects?[indexPath.row] else {return}
        item.isCompleted = !item.isCompleted
        CoreDataStack.saveToPersistentStore()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchedResultController.fetchedObjects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell
        let produceItem = fetchedResultController.fetchedObjects?[indexPath.row]
        cell?.produceItem = produceItem
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let item = fetchedResultController.fetchedObjects?[indexPath.row] else {return}
            CoreDataStack.delete(item: item)
        }
    }
    
    //MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Item", message: "Please add an item to your list.", preferredStyle: .alert)
        alertController.addTextField { (produceNameTextField) in
            produceNameTextField.placeholder = "Produce Name"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let produceTextField = alertController.textFields?[0].text else {return}
            guard produceTextField != "" else {return}
            Item(produceName: produceTextField)
            CoreDataStack.saveToPersistentStore()
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        present(alertController, animated: true)
        
    }
}
