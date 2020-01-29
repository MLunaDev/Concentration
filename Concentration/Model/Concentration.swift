//
//  Concentration.swift
//  Concentration
//
//  Created by Diogo, Mariana.
//  Copyright © 2020 Luna. All rights reserved.
//

import Foundation

class Concentration {
    
    //MARK: Properties
    var cards = [Card]()
    var indexOfOneCardFacedUp : Int?
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        
        cards.shuffle()
    }
    
    //MARK: Methods
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneCardFacedUp, matchIndex != index {
                //Check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFacedUp = true
                indexOfOneCardFacedUp = nil
            } else {
                //Either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFacedUp = false
                }
                cards[index].isFacedUp = true
                indexOfOneCardFacedUp = index
            }
            
        }
    }
}