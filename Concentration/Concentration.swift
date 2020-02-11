//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import Foundation

class Concentration {

    var cardFlips = 0
    var cards = [Card]()
    var prevFlippedCardIndex = -1

    init(numberOfUniqueCards: Int) {
        for _ in 1...numberOfUniqueCards {
            let card = Card()
            cards += [card, card]
        }
        initGame()
    }
    
    
    func initGame() {
        for index in cards.indices {
            let swapIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let temp = cards[index]
            cards[index] = cards[swapIndex]
            cards[swapIndex] = temp
        }
    }

//    TODO: implement a way to end the game and store final score
    func endGame() {}
    
    func restartGame() {
        endGame()
        initGame()
    }
    
    func matchingCardsSelected(_ first: Int,_ second: Int) -> Bool {
        return cards[first].id == cards[second].id
    }
    
    
    func updateFlips(indexOfCardChosen: Int) {
        if prevFlippedCardIndex == -1 {
            cards[indexOfCardChosen].isSelected = true
            prevFlippedCardIndex = indexOfCardChosen
        } else {
            if prevFlippedCardIndex == indexOfCardChosen {
                cards[indexOfCardChosen].isSelected = false
            } else {
                if matchingCardsSelected(indexOfCardChosen, prevFlippedCardIndex) {
                    cards[indexOfCardChosen].isSelected = true
                    cards[indexOfCardChosen].isMatched = true
                    cards[prevFlippedCardIndex].isMatched = true
                } else {
                    cards[indexOfCardChosen].isSelected = true
                    cards[prevFlippedCardIndex].isSelected = false
                    cards[indexOfCardChosen].isSelected = false
                }
            }
            prevFlippedCardIndex = -1
        }
        cardFlips += 1
    }
}
