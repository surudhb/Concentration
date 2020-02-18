//
//  ViewController.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var flipsLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet var mainView: UIView!
    
    //    Making it lazy so that variable is initialized when used and not now
    lazy private var game = Concentration(numberOfUniqueCards: cardButtons.count/2)
    lazy private var theme = ThemeGenerator(chosenTheme: ThemeGenerator.Theme.SUMMER, visualsDesired: cardButtons.count/2)
    
    // [card_id : visual_id]
    lazy private var cardToVisualMap : [Card:Int] = initCardVisualMap()
    
    private func initCardVisualMap() -> [Card:Int] {
        var tempMap = [Card:Int]()
        var it = 0
        for card in game.cards {
            if tempMap[card] == nil {
                tempMap[card] = theme.validVisualIndices[it]
                it += 1
            }
        }
        return tempMap
    }
    
    @IBAction private func didTouchCardButton(_ sender: UIButton) {
        game.updateFlips(indexOfCardChosen: cardButtons.firstIndex(of: sender)!)
        updateViewFromModel()
    }
    
    private func updateFlipsLabel() {
        flipsLabel.text = "Flips: \(game.cardFlips)"
    }
    
    private func updateCardButtons() {
        for (index, card) in game.cards.enumerated() {
            if card.isSelected || card.isMatched {
                cardButtons[index].setTitle("\(theme.visuals[theme.themeKeyname]![cardToVisualMap[card]!])", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : theme.colorPalette[theme.themeKeyname]!.cardFaceDown
            } else {
                cardButtons[index].setTitle("", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = theme.colorPalette[theme.themeKeyname]!.cardFaceUp
            }
        }
        mainView.backgroundColor = theme.colorPalette[theme.themeKeyname]!.background
    }
    
    private func updateViewFromModel() {
        updateFlipsLabel()
        updateCardButtons()
    }
    
//    TODO: Currently there is no way the controller updates links when the game ends and restarts resulting in a crash. Implement "reseting the view controller"
}
