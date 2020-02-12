//
//  ViewController.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var flipsLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
//    Making it lazy so that variable is initialized when used and not now
    lazy var game = Concentration(numberOfUniqueCards: cardButtons.count/2)
    lazy var theme = ThemeGenerator(chosenTheme: ThemeGenerator.Theme.FALL, visualsDesired: cardButtons.count/2)
    
    // [card_id : visual_id]
    lazy var cardToVisualMap : [Int:Int] = initCardVisualMap()
    
    func initCardVisualMap() -> [Int:Int] {
        var tempMap = [Int:Int]()
        var it = 0
        for index in 0..<game.cards.count {
            if tempMap[game.cards[index].id] == nil {
                tempMap[game.cards[index].id] = theme.validVisualIndices[it]
                it += 1
            }
        }
        return tempMap
    }
    
    @IBAction func didTouchCardButton(_ sender: UIButton) {
        game.updateFlips(indexOfCardChosen: cardButtons.firstIndex(of: sender)!)
        updateViewFromModel()
    }
    
    func updateFlipsLabel() {
        flipsLabel.text = "Flips: \(game.cardFlips)"
    }
    
    func updateCardButtons() {
        for index in game.cards.indices {
            if game.cards[index].isSelected || game.cards[index].isMatched  {
                cardButtons[index].setTitle("\(theme.visuals[theme.themeKeyname]![cardToVisualMap[game.cards[index].id]!])", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = game.cards[index].isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : theme.colorPalette[theme.themeKeyname]![1]
            } else {
                cardButtons[index].setTitle("", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = theme.colorPalette[theme.themeKeyname]![0]
            }
        }
    }
    
    func updateViewFromModel() {
        updateFlipsLabel()
        updateCardButtons()
    }
}
