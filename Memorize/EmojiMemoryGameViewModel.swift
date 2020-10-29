//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import Foundation
import Combine

class EmojiMemoryGameViewModel: ObservableObject {
    @Published private var gameModel: MemoryGame<String> = createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🐬", "🦖", "🐠", "🐲", "🐡", "🐥", "🦁", "🦄", "🐝"]
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
    
    func resetGame() {
        gameModel = EmojiMemoryGameViewModel.createMemoryGame()
    }
}
