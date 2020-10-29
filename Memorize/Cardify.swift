//
//  Cardify.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: Cardify.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: Cardify.cornerRadius).stroke(lineWidth: Cardify.edgeLineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
                RoundedRectangle(cornerRadius: Cardify.cornerRadius).fill()
                    .opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0, 1, 0))
    }
    
    private static let cornerRadius: CGFloat = 10
    private static let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
