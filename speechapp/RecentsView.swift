//
//  RecentsView.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 16/11/21.
//

import SwiftUI

struct RecentsView: View {
    @Binding var searchText: String
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        GeometryReader { screenDim in
            ScrollView {
                // MOST RECENT
                if searchText.isEmpty {
                    MostRecentTile(speech: mySpeeches[0], screenWidth: screenDim.size.width, screenHeight: screenDim.size.height, scale: mostRecentsScale)
                }
                //OTHER RECENTS
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*recentsScale.padding){
                    
                    ForEach(searchResults, id: \.self) { speech in
                        Tile(speech: speech, screenWidth: screenDim.size.width, screenHeight: screenDim.size.width, scale: recentsScale)
                    }
                    
                }.padding()
            }
        }
    }
}

private extension RecentsView {
    var searchResults: [Speech] {
        if searchText.isEmpty {
            return mySpeeches.filter{ $0 != mySpeeches[0] }
        } else {
            return mySpeeches.filter{ $0.title.contains(searchText) }
        }
    }
}
