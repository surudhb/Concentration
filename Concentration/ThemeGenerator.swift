//
//  Theme.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//
//  Returns the valid set of emojis to be used with the selected theme

import Foundation


class ThemeGenerator {
    
    enum Theme {
        case Winter
        case Spring
        case Summer
        case Fall
    }
    
    var chosenTheme = Theme.Fall
    
    init(chosenTheme: ThemeGenerator.Theme) {
        self.chosenTheme = chosenTheme
    }
//    atleast 10 each
    let WINTER_EMOJIS = Set(["🏂", "❄️", "⛄️", "🎿", "🥶", "⛷", "☃️", "☕️", "🧊", "⛸", "🏒", "🎅🏻", "🤧", "🤒", "🤶🏻", "🧶", "🐻"])
    let SPRING_EMOJIS = Set(["🌷", "🌸", "🌼", "🌧", "🌈", "🌦", "🛀🏻", "🚿", "🐛", "🐞", "🍃", "🍏", "🦋", "🌴", "⛹🏻‍♂️", "⚽️", "🐣"])
    let SUMMER_EMOJIS = Set(["🏄🏻‍♀️", "🤽🏻", "🧗🏻‍♀️", "🏏", "🍹", "🥑", "🍎", "☀️", "🌺", "🎋", "🐳", "🧜🏻‍♀️", "🥵", "🏖", "🏊🏻‍♀️", "🏕", "😎"])
    let FALL_EMOJIS = Set(["🎃", "💀", "👻", "🎐", "😱", "😰", "☠️", "😈", "🧛🏻‍♂️", "🧟‍♀️", "🦸🏻‍♀️", "🧝🏻‍♀️", "🤡", "👽", "🍁","🦇", "🏜"])
    
    func getUniquelyThemedEmojis(emojisDesired: Int) -> Set<String> {
        switch chosenTheme {
            case .Winter:
                return getUniquelyThemedEmojisHelper(emojisDesired, WINTER_EMOJIS)
            case .Spring:
                return getUniquelyThemedEmojisHelper(emojisDesired, SPRING_EMOJIS)
            case .Summer:
                return getUniquelyThemedEmojisHelper(emojisDesired, SUMMER_EMOJIS)
            case .Fall:
                return getUniquelyThemedEmojisHelper(emojisDesired, FALL_EMOJIS)
        }
    }
    
    func getUniquelyThemedEmojisHelper(_ emojisDesired: Int,_ emojiSet: Set<String>) -> Set<String> {
        let emojisAvailable = emojiSet.count
        if(emojisDesired >= emojisAvailable) {
            return emojiSet
        } else {
            var emojiSubset = Set<String>()
            repeat {
                emojiSubset.insert(emojiSet.randomElement()!)
            } while(emojiSubset.count < emojisDesired)
            return emojiSubset
        }
    }
    
    
}
