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

// Class designed to pull data from a json given a theme keyword and store and pass only the necessary images in memory
class ThemeGenerator {
    
    enum Theme : String {
        case WINTER
        case SPRING
        case SUMMER
        case FALL
    }
    
    public var chosenTheme = Theme.FALL {
        didSet {
            validVisualIndices = getThemedVisuals()
        }
    }
    private var numVisualsDesired = 0
    private(set) var validVisualIndices = [Int]()
    
    init(chosenTheme: ThemeGenerator.Theme, visualsDesired: Int) {
        assert(visualsDesired > 1, "Theme.init(): Must ask for one or more visuals")
        self.chosenTheme = chosenTheme
        numVisualsDesired = visualsDesired
        validVisualIndices = getThemedVisuals()
    }
    

    let colorPalette : [Theme:(cardFaceUp: UIColor, cardFaceDown: UIColor, background: UIColor)] = [
        Theme.WINTER : (UIColor.blue, UIColor.white, UIColor.red),
        Theme.SPRING : (UIColor.cyan, UIColor.yellow, UIColor.green),
        Theme.SUMMER : (UIColor.red, UIColor.yellow, UIColor.cyan),
        Theme.FALL : (UIColor.black, UIColor.orange, UIColor.brown)
    ]
    
    let visuals = [
        Theme.WINTER : ["🏂", "❄️", "⛄️", "🎿", "🥶", "⛷", "☃️", "☕️", "🧊", "⛸", "🏒", "🎅🏻", "🤧", "🤒", "🤶🏻", "🧶", "🐻"],
        Theme.SPRING : ["🌷", "🌸", "🌼", "🌧", "🌈", "🌦", "🛀🏻", "🚿", "🐛", "🐞", "🍃", "🍏", "🦋", "🌴", "⛹🏻‍♂️", "⚽️", "🐣"],
        Theme.SUMMER : ["🏄🏻‍♀️", "🤽🏻", "🧗🏻‍♀️", "🏏", "🍹", "🥑", "🍎", "☀️", "🌺", "🎋", "🐳", "🧜🏻‍♀️", "🥵", "🏖", "🏊🏻‍♀️", "🏕", "😎"],
        Theme.FALL : ["🎃", "💀", "👻", "🎐", "😱", "😰", "☠️", "😈", "🧛🏻‍♂️", "🧟‍♀️", "🦸🏻‍♀️", "🧝🏻‍♀️", "🤡", "👽", "🍁","🦇", "🏜"]
    ]
    
    public func toggle() {
        if chosenTheme == Theme.WINTER { chosenTheme = Theme.SPRING }
         else if chosenTheme == Theme.SPRING { chosenTheme = Theme.SUMMER }
        else if chosenTheme == Theme.SUMMER { chosenTheme = Theme.FALL }
        else if chosenTheme == Theme.FALL { chosenTheme = Theme.WINTER }
    }
    
    private func getThemedVisuals() -> [Int] {
        return getThemedVisualsHelper(visuals[chosenTheme]!)
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
