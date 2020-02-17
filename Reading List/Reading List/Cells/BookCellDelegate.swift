//
//  BookCellDelegate.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/17/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

protocol BookCellDelegate {
    func toggleHasBeenRead(cell: BookCell)
}
