//TEST

import SwiftUI

struct RecentsView1: View {
    @ObservedObject var dati: DataHandler 
    @Binding var searchText: String
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        GeometryReader { screenDim in
            ScrollView {
                // MOST RECENT
                if searchText.isEmpty {
                    MostRecentTile(speech: dati.GetAllSpechees()[0], screenWidth: screenDim.size.width, screenHeight: screenDim.size.height, scale: mostRecentsScale)
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
    
    var searchResults: [Speech] {
        if searchText.isEmpty {
            return dati.GetAllSpechees().filter{ $0 != dati.GetAllSpechees()[0] }
        } else {
            return dati.GetAllSpechees().filter{ $0.title.contains(searchText) }
        }
    }
}
