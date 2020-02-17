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
    public var isSelected = false
    public var isMatched = false
    
    private static var unusedID = 0
    private static func generateUUID() -> Int {
        unusedID += 1
        return unusedID
    }
//    TODO: This really shouldn't exist. Card Id's should not break game
    public static func resetUUIDGenerator() {
        unusedID = 0
    }
}
