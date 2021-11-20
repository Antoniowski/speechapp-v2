//
//  FlashcardView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FlashcardsView: View {
//    TEST
    var TEST = Text("State the top of your speech.\n\n Try to follow this questions:\n") + Text("**-What is the main topic of your speech?\n-Why should the audience listen to your speech?\n-What will your main points be?**")
    
    
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    var section: Section
    
    var body: some View {
        GeometryReader { screenDim in
            VStack{
                InfoBox(text: TEST)
                    .frame(width: screenDim.size.width, height: screenDim.size.height/4, alignment: .topLeading)
                    .background(Color(white: 0.95))
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
