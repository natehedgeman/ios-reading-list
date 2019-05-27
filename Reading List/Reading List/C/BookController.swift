//
//  BookController.swift
//  Reading List
//
//  Created by Nathan Hedgeman on 5/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    //Data array of books holds all the inputed books for the session. (Source of all truth)
    var books: [Book] = []
    
    
    //MARK: Saving and Loading Persistent Data ********
    
    //Computed property thats value will be the location of where DATA file will be saved for persistance. Its is optional because when app first runs, there will not be a value for this yet
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
    
    func saveToPersistentStore() {
        
        //Create an instance of the PropertyListEncoder class to access its properties and functions
        let encoder = PropertyListEncoder()
        
        //Do, Try, Catch block for encoding and Error logging
        do {
            // Create a property that holds the value of the encoded data array (Source of all truth)
            let booksData = try encoder.encode(books)
            
            //I need the location to save the encoded array (readingListURL) but it is optional and needs to be unwrapped first
            guard let url = readingListURL else {return}
            
            //Now write the encoded data (booksData) to the unwrapped computed property (url instance of readingListUrl)
            try booksData.write(to: url)
            
        } catch {
            
            //Logs any errors
            NSLog("Error saving data: \(error)")
            
        }
        
    }
    
    //function for loading data from .plist file and adding it back to the data array (books)
    
    func loadFromPersistentStore() {
        
        //Create an instance of PropertyListDecoder and FileManager classes to get access to their properties and functions
        let decoder = PropertyListDecoder()
        //let fm = FileManager.default
        
        //Unwrap another instance of the loacation of the saved data array so I can decode the .plist in that location
        
        //MARK: Shouldnt need fileExisits function
        guard let url = readingListURL/*, fm.fileExists(atPath: url.path)*/ else {return}
        
        
        
        /* 1. I have my decoder (decoder property) to decode whatever file I need
           2. I have my file manager (fm property) to gain access to the files I need to decode
           3. I have the location of the file that I need to decode (url property, readingListURL unwrapped)*/
        
        do {
            
            //Create a property to hold the data (encoded data) of the .plist file before it is decoded and "try" to get the data from the .plist
            let data = try Data(contentsOf: url)
            
            // Assign the data array (source of all truth) the value of the decoded data of the .plist file
            books = try decoder.decode([Book].self, from: data)
            
        } catch {
            
            //Logs any errors
            NSLog("Error loading data: \(error)")
            
        }
        
    }
    
    //MARK: CRUD ***********************************
    
    func Create(tite: String, reasonToRead: String) {
        
        //Create a property to hold a new Book's value
        let newBook = Book(title: tite, reasonToRead: reasonToRead)
        
        //Add the new "Book" to the data array
        books.append(newBook)
        
        saveToPersistentStore()
    }
    
    func Update(bookToUpdate: Book, title: String, reasonToRead: String) {
        
        //Check to make sure there is a value in the data array to update
        guard books.firstIndex(of: bookToUpdate) != nil else {return}
        
        //Add the "bookToUpdate: Book" to the data array
        books.append(bookToUpdate)
        
        saveToPersistentStore()
    }
    
    func UpdateHasBeenRead(bookToUpdate: Book) {
        
        //Create a varible to hold the value (bool) of the Book's hasBeenRead property to be updated
        //You can't change it's value directly because it (bookToUpdate as a parameter of the function) is a let constant
        var updateHasBeenRead = bookToUpdate.hasBeenRead
        
        //Sets whatever the value of the Book's hasbeenRead property to the opposite of whatever it is.
        updateHasBeenRead = !updateHasBeenRead
        
    }
    
    func Delete(bookToDelete: Book) {
        
        //Check to make sure there is a value in the data array to delet
        guard books.firstIndex(of: bookToDelete) != nil else {return}
        
        //Remove the "bookToDelete" from the data array at it's index number. (The .remove function requiers a integer: .remove(at: int))
        books.remove(at: books.count)
      
        saveToPersistentStore()
    }
    
    
    
    
    //MARK: Table Sections *********************
    
    //Create a computed property that can hold the value of an array of books that has been read
    var readBooks: [Book] {
        
        // same as a for in loop that loops through an array and uses the .filter function to selects the books that hasBeenRead (true)
        let rb = books.filter ({$0.hasBeenRead == true})
        
        //"returns" or sends the value of rb and assigns it to readBooks value
        //Probably could have been done without a computed property written in this format
        //i.e. readBooks: [Book] = books.filter ({$0.hasBeenRead == true})
        return rb
        
    }
    
    var unreadBooks: [Book] {
        
        // same as a for in loop that loops through an array and uses the .filter function to selects the books that hasBeenRead (false)
        let rb = books.filter ({$0.hasBeenRead == false})
        
        //"returns" or sends the value of rb and assigns it to unreadBooks value
        //Probably could have been done without a computed property written in this format
        //i.e. unreadBooks: [Book] = books.filter ({$0.hasBeenRead == false})
        return rb
        
    }
    
}
