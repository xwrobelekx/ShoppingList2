//
//  ItemListTableViewController.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class ItemListTableViewController: UITableViewController {
    
    //MARK: - Outlets
    
  
    
    //MARK: - Properties

    
    //MARK: - LifeCycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Fetched Result Controller
    
    
    
    
    
    



    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
        
        // we want a alert contrloller with text field to pop up
        //and 2 actions cancel and save
    }
    
    
    
    
    

}
