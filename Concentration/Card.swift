//
//  Card.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import Foundation

struct Card {
    
    private let id = Card.generateUUID()
    public var isSelected = false
    public var isMatched = false
    
    private static var unusedID = 0
    private static func generateUUID() -> Int {
        unusedID += 1
        return unusedID
    }
}

extension Card : Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.id == rhs.id
    }
}
