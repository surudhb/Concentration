//
//  Card.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import Foundation

struct Card {
    let id = Card.generateUUID()
    var isSelected = false
    var isMatched = false
    
    static var unusedID = 0
    static func generateUUID() -> Int {
        unusedID += 1
        return unusedID
    }
}
