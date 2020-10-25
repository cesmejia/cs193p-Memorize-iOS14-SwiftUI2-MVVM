//
//  ContentView.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import SwiftUI

struct ContentView: View {
    var emojiMemoryGameViewModel: EmojiMemoryGameViewModel
    
    var body: some View {
        HStack {
            ForEach(emojiMemoryGameViewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        emojiMemoryGameViewModel.choose(card: card)
                    }
            }
        }
            .padding()
        .foregroundColor(.orange)
        .font(.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(emojiMemoryGameViewModel: EmojiMemoryGameViewModel())
    }
}
