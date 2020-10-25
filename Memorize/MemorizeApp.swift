//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ces Mejia on 25/10/20.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(emojiMemoryGameViewModel: game)
        }
    }
}
