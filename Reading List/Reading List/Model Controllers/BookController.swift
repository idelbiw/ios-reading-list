//
//  BookController.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    
    //MARK: -important variables-
    var books: [Book] = [Book(reasons: "klaskhjfjklashflka", title: "dsfsdfsdfsdf")]
    
    var readBooks: [Book] {
        var readBooks: [Book] = []
        for book in books {
            if book.hasBeenRead {
                readBooks.append(book)
            }
        }
        return readBooks
    }
    
    var unreadBooks: [Book] {
        var unreadBooks: [Book] = []
        for book in books {
            if !book.hasBeenRead {
                unreadBooks.append(book)
            }
        }
        return unreadBooks
    }
    
    var readingListURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return documents.appendingPathComponent("ReadingList.plist")
    }
    
    //MARK: -save and load functions-
    func saveToPersistentStore() {
        let encoder = PropertyListEncoder()
        guard let url = readingListURL else {return}
        do {
            let data = try encoder.encode(books)
            try data.write(to: url)
        } catch {
            print("could not save books, error code: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        guard let url = readingListURL else {return}
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            let decodedBooks = try decoder.decode([Book].self, from: data)
            books = decodedBooks
        } catch {
            print("could not load books, error code: \(error)")
        }
    }
    
    //MARK: -CRUD Methods-
    func create(title: String, reasons: String) {
        let newBook = Book(reasons: reasons, title: title)
        books.append(newBook)
        saveToPersistentStore()
    }
    
    func delete(book: Book) {
        guard let index = books.firstIndex(of: book) else {return}
        books.remove(at: index)
        saveToPersistentStore()
    }
    
    func updateHasBeenRead(for book: Book) {
        guard let index = books.firstIndex(of: book) else {return}
        books[index].hasBeenRead.toggle()
        saveToPersistentStore()
    }
    
    func editBook(book: Book, newTitle: String, newReasons: String) {
        guard let index = books.firstIndex(of: book) else {return}
        var bookCopy = book
        bookCopy.title = newTitle
        bookCopy.reasonsToRead = newReasons
        books.remove(at: index)
        books.insert(bookCopy, at: index)
        saveToPersistentStore()
    }
    
}
