//
//  BookCell.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    //MARK: -Actions and Outlets-
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var buttonLabel: UIButton!
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.toggleHasBeenRead(cell: self)
        updateViews()
    }
    
    var book: Book? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        titleLabel.text = book?.title
        buttonLabel.setImage(book!.hasBeenRead ? UIImage(named: "checked") : UIImage(named: "unchecked"), for: .normal)
    }
    
    var delegate: BookCellDelegate?
    
}
