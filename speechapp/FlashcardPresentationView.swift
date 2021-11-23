//
//  FlashcardPresentationView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct Presentation: View{
    var cards: [Flashcard]
    @State var selection: String = ""
    
    var body: some View{
        GeometryReader{
            screenSize in
            TabView(selection: $selection){
                ForEach(cards, id: \.self){ flashcard in
                    FlashcardTile(card: flashcard, scale: flashcardScale)
                        .tag(flashcard.title)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .automatic))
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
                    .toolbar{navigationBarItems}
            }
            
        }
        
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
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


struct Presentation_Preview: PreviewProvider {
    static var previews: some View {
        PresentationView(speech: mySpeeches[0])
            
    }
}

