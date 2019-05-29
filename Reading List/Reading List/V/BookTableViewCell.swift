//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Nathan Hedgeman on 5/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    var book = Book.self
    
    weak var delegate: BookTableViewCellDelegate?
    
    //Outlets for button and label
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
    
    //Toggle button
    @IBAction func TableCellButtonTapped(_ sender: Any) {
        
        //MARK: I dont understand delegates and protocols
        delegate?.toggleHasBeenRead(for: self)
        
    }
    
    //This function sets the inital title and the image for the table cells
    func updateViews(book: Book) {
        
        TableCellLabel.text = book.title
        
        //?A delegate will handle the "checked" and "unchecked" states of the button image?
        TableCellButton.setImage(UIImage(named: "unchecked"), for: .normal)
        
        
    }
    
}

extension BookTableViewCellDelegate {
    
}
