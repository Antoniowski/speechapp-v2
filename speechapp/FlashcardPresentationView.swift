//
//  FlashcardPresentationView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

//TODO: ADD GESTURES TO CHANGE CARD SIDE

import SwiftUI

struct Presentation: View{
    var cards: [Flashcard]
    
    var body: some View{
        GeometryReader{
            screenSize in
            TabView{
                ForEach(cards, id: \.self){ flashcard in
                    FlashcardTile(symbol: flashcard.symbol, title: flashcard.title, color: flashcard.color, screenWidth: screenSize.size.width, screenHeight: screenSize.size.height, scale: flashcardScale, description: flashcard.description, front: true)
                }
                .frame(height: screenSize.size.height)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct PresentationView: View{
    @Environment(\.dismiss) private var dismiss
    
    var speech: Speech
    
    var body: some View{
        NavigationView{
            //BACKGROUND
            ZStack{
                Color(white: 0, opacity: 0.5)
                    .ignoresSafeArea()
                Presentation(cards: speech.getAllFlashcards())
                    .navigationTitle(speech.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarItems(trailing:navigationBarTrailingItems)
            }
            
        }
        
    }
}

private extension PresentationView {
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack{
            Button(action: {
                dismiss()
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}




