//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Nathan Hedgeman on 5/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TableCellLabel: UILabel!
    @IBOutlet weak var TableCellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func TableCellButtonTapped(_ sender: Any) {
        
        
        
    }
    
}
