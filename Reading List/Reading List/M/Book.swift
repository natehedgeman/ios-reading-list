//
//  Book.swift
//  Reading List
//
//  Created by Nathan Hedgeman on 5/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    
    var title        :String
    var reasonToRead :String
    var hasBeenRead  :Bool
    
    init(title: String, reasonToRead: String, hasBeenRead: Bool = false) {
        self.title = title
        self.reasonToRead = reasonToRead
        self.hasBeenRead = hasBeenRead
    }
    
}
