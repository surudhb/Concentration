//
//  Theme.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//
//  Returns the valid set of emojis to be used with the selected theme

import Foundation


class Theme {
    
    enum Season {
        case Winter
        case Spring
        case Summer
        case Fall
    }
    
    var myTheme = Season.Fall
    
    init(season: Theme.Season) {
        myTheme = season
    }
    
    let WINTER_EMOJIS = ["","","",""]
    let SPRING_EMOJIS = [""]
    let SUMMER_EMOJIS = [""]
    let FALL_EMOJIS = ["🎃", "💀", "👻", "🌚", "😱", "😰", "☠️", "😈", "🧛🏻‍♂️", "🧟‍♀️", "🧝🏻‍♀️", "🤡", "👽"]
    
    func getUniquelyThemedEmojis(count: Int) -> [String] {
        switch myTheme {
            case .Winter:
                return getUniquelyThemedEmojisHelper(count, WINTER_EMOJIS)
            case .Spring:
                return getUniquelyThemedEmojisHelper(count, SPRING_EMOJIS)
            case .Summer:
                return getUniquelyThemedEmojisHelper(count, SUMMER_EMOJIS)
            case .Fall:
                return getUniquelyThemedEmojisHelper(count, FALL_EMOJIS)
        }
    }
    
    func getUniquelyThemedEmojisHelper(_ count: Int,_ emojiArray: [String]) -> [String] {
        let emojiCount = emojiArray.count
        if(emojiCount >= count) {
            return emojiArray
        } else {
        }
        return [""]
    }
    
    
}
