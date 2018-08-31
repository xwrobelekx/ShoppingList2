//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Kamil Wrobel on 8/31/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

import UIKit

protocol ItemTableViewDelegate: class{
    func completeButtonTapped(cell: ItemTableViewCell)
}

class ItemTableViewCell: UITableViewCell {
    
    //MARK: Properties
    var produceItem : Item? {
        didSet{
            updateViews()
        }
    }
    weak var delegate : ItemTableViewDelegate?
    
    //MARK: Outlets
    @IBOutlet weak var produceNameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    //MARK: - LifeCycle Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: - Methods
    func updateViews() {
        guard let produceItem = produceItem else {return}
        produceNameLabel.text = produceItem.produceName
        updateButton()
    }
    
    func updateButton() {
        guard let produceItem = produceItem else {return}
        if produceItem.isCompleted {
            checkBoxButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else {
            checkBoxButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        }
    }
    
    //MARK: - Actions
    @IBAction func checkBoxTapped(_ sender: Any) {
        delegate?.completeButtonTapped(cell: self)
    }
}
