//
//  FavoritesView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FavoritesView: View {
    var body: some View {
        
        NavigationView{
            Favorites()
        }
        
    }
}

struct Favorites: View{
    @State var searchText = ""
    private var gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View{
        GeometryReader { screenDim in
            ScrollView{
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*favoritesScale.padding){
                    
                    ForEach(mySpeeches, id: \.self) { speech in
                        if speech.isFavorite {
                            Tile(symbol: speech.symbol, title: speech.title, color: speech.color, screenWidth: screenDim.size.width, screenHeight: screenDim.size.width, scale: favoritesScale)
                        }
                    }
                    
                }.padding()
            }
        }
        .navigationTitle("Favorites")
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
