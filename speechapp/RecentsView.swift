//
//  RecentsView.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 16/11/21.
//

import SwiftUI

struct RecentsView: View {
    var body: some View {
        
        NavigationView{
            Recents()
        }
        
    }
}

struct Recents: View {
    @State var searchText = ""
    private var gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
            GeometryReader { screenDim in
                ScrollView {
                    // MOST RECENT
                    Tile(symbol: mySpeeches[0].symbol, title: mySpeeches[0].title, color: mySpeeches[0].color, screenWidth: screenDim.size.width, screenHeight: screenDim.size.height, scale: mostRecentsScale)
                    //OTHER RECENTS
                    LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*recentsScale.padding){
                        
                        ForEach(mySpeeches, id: \.self) { speech in
                            if speech != mySpeeches[0] {
                                Tile(symbol: speech.symbol, title: speech.title, color: speech.color, screenWidth: screenDim.size.width, screenHeight: screenDim.size.width, scale: recentsScale)
                            }
                        }
                        
                    }.padding()
                }
            }
            .navigationTitle("Recents")
            .navigationBarItems(leading:
                HStack {
                //left
            },              trailing:
                HStack {
                    Button(action: {
                    //do
                    }, label: {
                        Image(systemName: "plus")
                    })
            })
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .onChange(of: searchText) {
                searchText in
                if !searchText.isEmpty {
                    // do
                } else {
                    // do
                }
            }
    }
}
