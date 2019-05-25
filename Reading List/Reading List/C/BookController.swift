//
//  BookController.swift
//  Reading List
//
//  Created by Nathan Hedgeman on 5/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    //Array of books holds all the inputed books for the session
    var books: [Book] = []
    
    
    //MARK: Saving and Loading Persistent Data
    
    //Computed property thats value will be the location of where DATA file will be saved for persistance
    var readingListURL: URL? {
        
        //start to find the directory by creating an instance of FileManger
        let fm = FileManager.default
        
        // create a property to hold the value of the function to locate a directory path
        // value must be unwrapped because this is a computed property, it needs a value. It must return at least nil
        guard let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        
        //now return the attached URL value of the unwrapped property "documents" for the computed property (readingListURL) to have a value and create a file (with the .appendingPathComponent method) at the URL path. In this case a .plist file
        
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
    //function for saving Array data to the computed property (readingListURL)
    
    func savePersistentStore() {
        
        
        
    }
    
    
}
