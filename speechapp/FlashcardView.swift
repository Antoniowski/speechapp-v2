//
//  FlashcardView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FlashcardsView: View {
    
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    var section: Section
    
    var body: some View {
        GeometryReader { screenDim in
            VStack{
                InfoBox()
                    .frame(width: screenDim.size.width, height: screenDim.size.height/4)
                    .border(.red, width: 3)
                ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*recentsScale.padding){
                        ForEach(section.cards, id: \.self) { card in
                            FlashcardPreviewTile(section: section, title: card.title, symbol: card.symbol, screenWidth: screenDim.size.width, screenHeight: screenDim.size.height, scale: recentsScale)
                        }
                        
                    }.padding()
                }
                .navigationTitle(section.title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
    
}
