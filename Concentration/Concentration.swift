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
    
    func endGame() {}
    
    func restartGame() {
        endGame()
        initGame()
    }
    
    func checkForMatch(first: Int, second: Int) {
        if(cards[first].id == cards[second].id) {
            cards[first].isMatched = true
            cards[second].isMatched = true
        } else {
            cards[first].isSelected = false
            cards[second].isSelected = false
        }
    }
    
    
    
    func updateFlips(indexOfCardChosen: Int) {
        if(prevFlippedCardIndex > 0) {
//            there is another card already selected
            if(prevFlippedCardIndex == indexOfCardChosen) {
//                unselect selected card
                cards[prevFlippedCardIndex].isSelected = !cards[prevFlippedCardIndex].isSelected
                prevFlippedCardIndex = -1
            } else {
//            select new card
                cards[indexOfCardChosen].isSelected = !cards[prevFlippedCardIndex].isSelected
//            two cards selected, play round
                checkForMatch(first: prevFlippedCardIndex, second: indexOfCardChosen)
                prevFlippedCardIndex = -1
            }
        } else {
//            there is no other card selected
            cards[indexOfCardChosen].isSelected = !cards[indexOfCardChosen].isSelected
            prevFlippedCardIndex = indexOfCardChosen
        }
        cardFlips += 1
    }

}
