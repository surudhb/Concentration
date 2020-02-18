//
//  ViewController.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var flipsLabel: UILabel! { didSet { updateFlipsLabel() } }
    @IBOutlet private var cardButtons: [UIButton]! {
        didSet {
            game = Concentration(numberOfUniqueCards: cardButtons.count/2)
            theme = ThemeGenerator(chosenTheme: ThemeGenerator.Theme.WINTER, visualsDesired: cardButtons.count/2)
        }
    }
    @IBOutlet var mainView: UIView! { didSet { initView() } }
    
    private var game : Concentration!
    private var theme : ThemeGenerator!
    
    // [card_id : visual_id]
    private var cardToVisualMap = [Card:Int]()
    
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
    
//    Acts as the init method for the main view
    func initView() {
        updateCardButtons()
        cardToVisualMap = initCardVisualMap()
    }
    
    @IBAction private func didTouchCardButton(_ sender: UIButton) {
        game.updateFlips(indexOfCardChosen: cardButtons.firstIndex(of: sender)!)
        updateViewFromModel()
    }
    
    private func updateFlipsLabel() {
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(game.cardFlips)", attributes: attributes)
        flipsLabel.attributedText = attributedString
    }
    
    private func updateCardButtons() {
        for (index, card) in game.cards.enumerated() {
            if card.isSelected || card.isMatched {
                cardButtons[index].setTitle("\(theme.visuals[theme.themeKeyname]![cardToVisualMap[card]!])", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : theme.colorPalette[theme.themeKeyname]!.cardFaceUp
            } else {
                cardButtons[index].setTitle("", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = theme.colorPalette[theme.themeKeyname]!.cardFaceDown
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
