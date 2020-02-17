//
//  Book.swift
//  Reading List
//
//  Created by Waseem Idelbi on 2/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Book: Equatable, Codable {
    var title: String
    var reasonsToRead: String
    var hasBeenRead: Bool
    
    init(hasBeenRead: Bool = false, reasons: String, title: String) {
        self.hasBeenRead = hasBeenRead
        self.title = title
        self.reasonsToRead = reasons
        
    }
}
