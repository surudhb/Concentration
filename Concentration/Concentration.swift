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
    var numCardsSelected = 0

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

    func endGame() {
        Card.resetUUIDGenerator()
        cards = []
        cardFlips = 0
    }
    
    func restartGame() {
        endGame()
        initGame()
    }
    
    func updateMatches() {
        let selectedCards = cards.filter{ $0.isSelected }
        if selectedCards.count == 2 && selectedCards[0].id == selectedCards[1].id {
            cards = cards.map{(card) -> Card in
                var tempCard = card
                if card.id == selectedCards[0].id || card.id == selectedCards[1].id {
                    tempCard.isMatched = true
                }
                return tempCard
            }
        }
    }
    
    
    func isGameOver() -> Bool {
        return cards.filter { !$0.isMatched }.count == 0
    }
    
    func resetSelectedState() {
        cards = cards.map{(card) -> Card in
            var tempCard = card
            tempCard.isSelected = false
            return tempCard
        }
    }
 
    func matchingCardsSelected(_ first: Int,_ second: Int) -> Bool {
        return cards[first].id == cards[second].id
    }
    
    func updateFlips(indexOfCardChosen: Int) {
        if !cards[indexOfCardChosen].isMatched {
//            selected card unselected
            if cards[indexOfCardChosen].isSelected {
                cards[indexOfCardChosen].isSelected = false
                numCardsSelected -= 1
            } else if numCardsSelected == 2 {
//                third card selected
                resetSelectedState()
                cards[indexOfCardChosen].isSelected = true
                numCardsSelected = 1
            } else {
//                0 or 1 card already selected
                numCardsSelected += 1
                cards[indexOfCardChosen].isSelected = true
                updateMatches()
            }
            if isGameOver() { restartGame() } else { cardFlips += 1 }
        }
    }
}
