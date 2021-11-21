//
//  FlashcardView.swift
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FlashcardsView: View {
    @State private var revealDetails = false
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    var section: Section
    
    var body: some View {
        GeometryReader { screenDim in
            VStack{
//                InfoBox(text: info)
                infoBox
                ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*recentsScale.padding){
                        ForEach(section.cards, id: \.self) { card in
                            FlashcardPreviewTile(card: card, screenWidth: screenDim.size.width, screenHeight: screenDim.size.height, scale: recentsScale)
                        }
                        
                    }.padding()
                }
                .navigationTitle(section.title)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

private extension FlashcardsView {
    var info: [Text] {
        switch section.type {
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
            .background(.quaternary)
    }
}

//struct Preview: PreviewProvider{
//    static var previews: some View{
//        FlashcardsView(section: mySpeeches[0].sections[0])
//            .accentColor(appAccentColor)
//    }
//}
