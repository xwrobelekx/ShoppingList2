//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    var produceItem : Item? {
        didSet{
            updateViews()
        }
    }
    
    //MARK: Outlets
    @IBOutlet weak var produceNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - Methods
    func updateViews() {
        //FIXME: add the body to the function
    }
    
    
    
    //MARK: - Actions
    @IBAction func checkBoxTapped(_ sender: Any) {
        
    }
    

}
