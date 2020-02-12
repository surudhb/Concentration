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
    var numUniqueCards = 0

    init(numberOfUniqueCards: Int) {
        numUniqueCards = numberOfUniqueCards
        initGame()
    }
    
    func createDeck() {
        for _ in 1...numUniqueCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func initGame() {
        createDeck()
        cards.shuffle()
    }

//    TODO: implement a way to end the game and store final score
    func endGame() {
        cards = []
        cardFlips = 0
    }
    
    func restartGame() {
        endGame()
        initGame()
    }
    
    func isGameOver() -> Bool {
        for card in cards {
            if(!card.isSelected) { return false }
        }
        return true
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
            if isGameOver() { restartGame() }
        }
        cardFlips += 1
    }
}
