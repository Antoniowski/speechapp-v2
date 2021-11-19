//
//  FlashcardView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FlashcardsView: View {
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    var cards: [Flashcard]
    
    var body: some View {
        GeometryReader { screenDim in
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*recentsScale.padding){
                    ForEach(cards, id: \.self) { card in
//                        Tile(speech: speech, screenWidth: screenDim.size.width, screenHeight: screenDim.size.width, scale: recentsScale)
                    }
                    
                }.padding()
            }
        }
    }
    
}
