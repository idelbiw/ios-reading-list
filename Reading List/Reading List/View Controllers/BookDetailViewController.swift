//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    var book: Book?
    var bookController: BookController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    
    @IBOutlet var titleLabel: UITextField!
    @IBOutlet var reasonsTextView: UITextView!
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let title = titleLabel.text,
            let reasons = reasonsTextView.text,
            !title.isEmpty,
            !reasons.isEmpty else {return}
        
        if book == nil {
            bookController?.create(title: title, reasons: reasons)
        } else {
            bookController?.editBook(book: book!, newTitle: title, newReasons: reasons)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        if book == nil {
            title = "Add a New Book"
        } else {
            titleLabel.text = book?.title
            reasonsTextView.text = book?.reasonsToRead
            self.title = book?.title
        }
    }
}
