//
//  FlashcardView.swift
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FlashcardsView: View {
    @EnvironmentObject var data: DataHandler
    @State private var showEditF = false
    @State private var revealDetails = false
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var speech: Speech
    var part: Part
    
    var body: some View {
        GeometryReader { screenDim in
            VStack{
                infoBox
                ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*recentsScale.padding){
                        ForEach(part.cards, id: \.self) { card in
                            FlashcardPreviewTile(card: card, screenWidth: screenDim.size.width, screenHeight: screenDim.size.height, scale: recentsScale, speech: speech, part: part)
                        }
                        
                    }.padding()
                }
                .navigationTitle(part.title)
                .navigationBarItems(trailing: navigationBarItems)
                .navigationBarTitleDisplayMode(.inline)
                
            }
        }
        
    }
}

private extension FlashcardsView {
    var info: [Text] {
        switch part.type {
        case .start:
            return infoText[0]
        case .mid:
            return infoText[1]
        case .end:
            return infoText[2]
        }
    }
    
    @ViewBuilder
    var infoBox: some View {
        DisclosureGroup(isExpanded: $revealDetails,
                        content: { info[1].padding() },
                        label: {
            HStack{
                info[0]
                    .font(.headline)
                    .foregroundColor(.primary)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Button {
                    revealDetails.toggle()
                } label: {
                    Image(systemName: "info.circle")
                }
                .padding()
                .font(.title2)
            }
        })
            .padding()
            .background(.bar)
    }
}

private extension FlashcardsView {
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack {
            Button(action: {
                showEditF.toggle()
            }, label: {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showEditF) {
                    NavigationView{
                        EditFlashcard(speech: speech, part: part)
                            .navigationTitle("Add Flashcard")
                    }
                }
        }
    }
}

//struct Preview: PreviewProvider{
//    static var previews: some View{
//        FlashcardsView(part: mySpeeches[0].parts[0])
//    }
//}
