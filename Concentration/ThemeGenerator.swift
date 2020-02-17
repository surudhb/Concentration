//
//  Theme.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//
//  Returns the valid set of emojis to be used with the selected theme

import Foundation
import UIKit

class ThemeGenerator {
    
    enum Theme : String {
        case WINTER
        case SPRING
        case SUMMER
        case FALL
    }
    
    public var chosenTheme = Theme.FALL
    private var numVisualsDesired = 0
    private(set) var themeKeyname = ""
    private(set) var validVisualIndices = [Int]()
    
    init(chosenTheme: ThemeGenerator.Theme, visualsDesired: Int) {
        self.chosenTheme = chosenTheme
        numVisualsDesired = visualsDesired
        validVisualIndices = getThemedVisuals()
        themeKeyname = chosenTheme.rawValue
    }
    
//    theme : [cardfacedown, cardfaceup, background]
     let colorPalette : [String:[UIColor]] = [
        "WINTER" : [UIColor.red, UIColor.blue, UIColor.white],
        "SPRING" : [UIColor.green, UIColor.yellow, UIColor.cyan],
        "SUMMER" : [UIColor.orange, UIColor.red, UIColor.yellow],
        "FALL" : [UIColor.red, UIColor.black, UIColor.orange]
    ]
    
    let visuals = [
        "WINTER" : ["🏂", "❄️", "⛄️", "🎿", "🥶", "⛷", "☃️", "☕️", "🧊", "⛸", "🏒", "🎅🏻", "🤧", "🤒", "🤶🏻", "🧶", "🐻"],
        "SPRING" : ["🌷", "🌸", "🌼", "🌧", "🌈", "🌦", "🛀🏻", "🚿", "🐛", "🐞", "🍃", "🍏", "🦋", "🌴", "⛹🏻‍♂️", "⚽️", "🐣"],
        "SUMMER" : ["🏄🏻‍♀️", "🤽🏻", "🧗🏻‍♀️", "🏏", "🍹", "🥑", "🍎", "☀️", "🌺", "🎋", "🐳", "🧜🏻‍♀️", "🥵", "🏖", "🏊🏻‍♀️", "🏕", "😎"],
        "FALL" : ["🎃", "💀", "👻", "🎐", "😱", "😰", "☠️", "😈", "🧛🏻‍♂️", "🧟‍♀️", "🦸🏻‍♀️", "🧝🏻‍♀️", "🤡", "👽", "🍁","🦇", "🏜"]
    ]
    
    private func getThemedVisuals() -> [Int] {
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
    private func getThemedVisualsHelper(_ visuals: [String]) -> [Int] {
        let visualsAvailable = visuals.count
        if(numVisualsDesired >= visualsAvailable) {
            return Array(visuals.indices)
        } else {
            return Array(Array(visuals.indices).shuffled().prefix(numVisualsDesired))
        }
    }
}
