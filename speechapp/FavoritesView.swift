//
//  FavoritesView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var data: DataHandler
    @Binding var searchText: String
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View{
        GeometryReader { screenDim in
            ScrollView{
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*favoritesScale.padding){
                    ForEach(searchResults, id: \.self) { speech in
                        Tile(data: data, speech: speech, screenWidth: screenDim.size.width, screenHeight: screenDim.size.width, scale: favoritesScale)
                    }
                    
                }.padding()
            }
        }
    }

    var searchResults: [Speech] {
        if searchText.isEmpty {
            return data.GetAllSpechees().filter{ $0.isFavorite == true }
        } else {
            return data.GetAllSpechees().filter{ $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}

// DEPRECATED
struct FavoritesViewDeprecated: View{
    @ObservedObject var data: DataHandler
    @Binding var searchText: String
    var gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View{
        GeometryReader { screenDim in
            ScrollView{
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*favoritesScale.padding){
                    
                    ForEach(searchResults, id: \.self) { speech in
                        Tile(data: data, speech: speech, screenWidth: screenDim.size.width, screenHeight: screenDim.size.width, scale: favoritesScale)
                    }
                    
                }.padding()
            }
        }
    }

    var searchResults: [Speech] {
        if searchText.isEmpty {
            return mySpeeches.filter{ $0.isFavorite == true }
        } else {
            return mySpeeches.filter{ $0.title.contains(searchText) }
        }
    }
}
