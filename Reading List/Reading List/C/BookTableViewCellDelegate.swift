//
//  BookTableViewCellDelegate.swift
//  Reading List
//
//  Created by Nathan Hedgeman on 5/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol BookTableViewCellDelegate: class {
    
    func toggleHasBeenRead(for cell: BookTableViewCell)
    
}
