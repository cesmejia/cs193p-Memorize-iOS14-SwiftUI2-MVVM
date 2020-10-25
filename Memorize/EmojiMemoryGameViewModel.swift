//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import SwiftUI

class EmojiMemoryGameViewModel {
    private var gameModel: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐙", "🦚", "🐳"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: [MemoryGame<String>.Card] {
        gameModel.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        gameModel.choose(card: card)
    }
}
