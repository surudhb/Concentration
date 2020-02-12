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
    
    enum Theme : String {
        case WINTER
        case SPRING
        case SUMMER
        case FALL
    }
    
    var chosenTheme = Theme.FALL
    var numVisualsDesired = 0
    var validVisualsKeyname = ""
    var validVisualIndices = [Int]()
    
    init(chosenTheme: ThemeGenerator.Theme, visualsDesired: Int) {
        self.chosenTheme = chosenTheme
        numVisualsDesired = visualsDesired
        validVisualIndices = getThemedVisuals()
        validVisualsKeyname = chosenTheme.rawValue
    }
    
//    atleast 10 each
//    TODO: Move to json file
    let visuals = [
        "WINTER" : ["🏂", "❄️", "⛄️", "🎿", "🥶", "⛷", "☃️", "☕️", "🧊", "⛸", "🏒", "🎅🏻", "🤧", "🤒", "🤶🏻", "🧶", "🐻"],
        "SPRING" : ["🌷", "🌸", "🌼", "🌧", "🌈", "🌦", "🛀🏻", "🚿", "🐛", "🐞", "🍃", "🍏", "🦋", "🌴", "⛹🏻‍♂️", "⚽️", "🐣"],
        "SUMMER" : ["🏄🏻‍♀️", "🤽🏻", "🧗🏻‍♀️", "🏏", "🍹", "🥑", "🍎", "☀️", "🌺", "🎋", "🐳", "🧜🏻‍♀️", "🥵", "🏖", "🏊🏻‍♀️", "🏕", "😎"],
        "FALL" : ["🎃", "💀", "👻", "🎐", "😱", "😰", "☠️", "😈", "🧛🏻‍♂️", "🧟‍♀️", "🦸🏻‍♀️", "🧝🏻‍♀️", "🤡", "👽", "🍁","🦇", "🏜"]
    ]
    
    func getThemedVisuals() -> [Int] {
        switch chosenTheme {
            case .WINTER:
                return getThemedVisualsHelper(visuals[Theme.WINTER.rawValue]!)
            case .SPRING:
                return getThemedVisualsHelper(visuals[Theme.SPRING.rawValue]!)
            case .SUMMER:
                return getThemedVisualsHelper(visuals[Theme.SUMMER.rawValue]!)
            case .FALL:
                return getThemedVisualsHelper(visuals[Theme.FALL.rawValue]!)
        }
    }
    
//    if desired emojis > available, return all indices else return an array of size desired with random indices from the theme
    func getThemedVisualsHelper(_ visuals: [String]) -> [Int] {
        let visualsAvailable = visuals.count
        if(numVisualsDesired >= visualsAvailable) {
            return Array(visuals.indices)
        } else {
            let temp = Array(Array(visuals.indices).shuffled().prefix(numVisualsDesired))
            return temp
        }
    }
}
