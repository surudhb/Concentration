//
//  ConcentrationModel.swift
//  Concentration
//
//  Created by Surudh Bhutani on 2020-02-10.
//  Copyright © 2020 Number13. All rights reserved.
//

import Foundation

class Concentration {

    private(set) var cardFlips = 0
    private(set) var cards = [Card]()
    private var numUniqueCards = 0
    private var numCardsSelected = 0

    init(numberOfUniqueCards: Int) {
        assert(numberOfUniqueCards > 0, "Must ask for atleast one unique card")
        numUniqueCards = numberOfUniqueCards
        initGame()
    }
    
    private func createDeck() {
        for _ in 1...numUniqueCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    private func initGame() {
        createDeck()
        cards.shuffle()
    }

//    TODO: Remove use of this function
    private func endGame() {
        Card.resetUUIDGenerator()
        cards = []
        cardFlips = 0
    }
    
    private func restartGame() {
        endGame()
        initGame()
    }
    
    private func updateMatches() {
        let selectedCards = cards.filter{ $0.isSelected }
        if selectedCards.count == 2 && selectedCards[0].id == selectedCards[1].id {
            cards = cards.map{(card) -> Card in
                var tempCard = card
                if selectedCards.contains(where: {$0.id == tempCard.id}) {
                    tempCard.isMatched = true
                }
                return tempCard
            }
        }
    }
    
    private func isGameOver() -> Bool {
        return cards.filter { !$0.isMatched }.count == 0
    }
    
    private func unselectAllCards() {
        cards = cards.map{(card) -> Card in
            var tempCard = card
            tempCard.isSelected = false
            return tempCard
        }
    }
 
    private func matchingCardsSelected(_ first: Int,_ second: Int) -> Bool {
        return cards[first].id == cards[second].id
    }
    
    public func updateFlips(indexOfCardChosen: Int) {
        assert(cards.indices.contains(indexOfCardChosen), "Concentration.updateFlips(index): index out of bounds")
        if !cards[indexOfCardChosen].isMatched {
//            selected card unselected
            if cards[indexOfCardChosen].isSelected {
                cards[indexOfCardChosen].isSelected = false
                numCardsSelected -= 1
            } else if numCardsSelected == 2 {
//                third card selected
                unselectAllCards()
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
