//
//  ContentView.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var emojiMemoryGameViewModel: EmojiMemoryGameViewModel
    
    var body: some View {
//        HStack {
//            ForEach(emojiMemoryGameViewModel.cards) { card in
//                CardView(card: card)
//                    .onTapGesture {
//                        emojiMemoryGameViewModel.choose(card: card)
//                    }
//            }
//        }
        VStack {
            GeometryReader { geometry in
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 10) {
                    ForEach(emojiMemoryGameViewModel.cards) { card in
                        CardView(card: card)
                            .frame(height: geometry.size.height / CGFloat(emojiMemoryGameViewModel.cards.count / 2))
                            .onTapGesture {
                                withAnimation(.linear) {
                                    emojiMemoryGameViewModel.choose(card: card)
                                }
                            }
                    }
                }
            }
                .padding()
            .foregroundColor(.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    emojiMemoryGameViewModel.resetGame()
                }
            }, label: {
                Text("New Game")
            })
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemaining = 0
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            if card.isFaceUp || !card.isMatched {
                ZStack {
                    Group {
                        if card.isConsumingBonusTime {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaining * 360 - 90))
                                .onAppear {
                                    startBonusTimeAnimation()
                                }
                        } else {
                            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90))
                        }
                    }
                    .padding(5)
                    .opacity(0.4)
                    .transition(.identity)
                    Text(card.content)
                        .font(Font.system(size: min(geometry.size.width, geometry.size.height) * CardView.fontScaleFactor))
                        .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                        .animation(card.isMatched ? Animation.linear.repeatForever(autoreverses: false) : .default)
                }
                .cardify(isFaceUp: card.isFaceUp)
                .transition(.scale)
            }
        }
    }
    
    // MARK: - Drawing Constants
    private static let fontScaleFactor: CGFloat = 0.7
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return ContentView(emojiMemoryGameViewModel: game)
    }
}
