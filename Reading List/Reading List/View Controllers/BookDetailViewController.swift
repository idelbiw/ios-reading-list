//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBOutlet var titleLabel: UITextField!
    @IBOutlet var reasonsTextView: UITextView!
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleLabel.text,
            let reasons = reasonsTextView.text,
            !titleLabel.text!.isEmpty,
            !reasonsTextView.text.isEmpty else {return}
        
        if book == nil {
            bookController?.create(title: title, reasons: reasons)
        } else {
            bookController?.editBook(book: book!, newTitle: title, newReasons: reasons)
        }
    }
    
    var bookController: BookController?
    var book: Book?
    
    func updateViews() {
        if book == nil {
            titleLabel.text = "Add a New Book"
        } else {
            titleLabel.text = book?.title
            reasonsTextView.text = book?.reasonsToRead
            self.title = book?.title
        }
    }
}
