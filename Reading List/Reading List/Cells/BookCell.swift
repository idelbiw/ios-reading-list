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
    }
    
    var book: Book?
    
    func updateViews() {
        titleLabel.text = book?.title
        switch book?.hasBeenRead {
        case false:
            buttonLabel.imageView?.image = UIImage(named: "unchecked")
        case true:
            buttonLabel.imageView?.image = UIImage(named: "checked")
        case .none:
            print("idk")
        case .some(_):
            print("idk man")
        }
    }
    
    var delegate: BookCellDelegate?
    
}
