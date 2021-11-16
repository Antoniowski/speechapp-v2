//
//  FlashcardPresentationView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct Presentation: View{
    
    var body: some View{
        GeometryReader{
            screenSize in
            TabView{
                ForEach(myFlashcards, id: \.self){ flashcard in
                    FlashcardTile(symbol: flashcard.symbol, title: flashcard.title, color: flashcard.color, screenWidth: screenSize.size.width, screenHeight: screenSize.size.height, scale: flashcardScale, description: flashcard.description, front: false)
                }
                .frame(height: screenSize.size.height)
                .border(.red , width: 3)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct PresentationView: View{
    var body: some View{
        NavigationView{
                Presentation()
                    .navigationTitle("Name")
                    .navigationBarTitleDisplayMode(.inline)
        }
        .padding()
    }
}

struct Preview2: PreviewProvider{
    static var previews: some View{
        PresentationView()
    }
}



