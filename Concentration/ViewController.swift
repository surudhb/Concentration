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
        for index in 0..<cardButtons.count/2 {
            tempMap[index + 1] = theme.validVisualIndices[index]
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
            if game.cards[index].isSelected {
                cardButtons[index].setTitle("\(theme.visuals[theme.validVisualsKeyname]![cardToVisualMap[game.cards[index].id]!])", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            } else {
                cardButtons[index].setTitle("", for: UIControl.State.normal)
                cardButtons[index].backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    func updateViewFromModel() {
        updateFlipsLabel()
        updateCardButtons()
    }
}
