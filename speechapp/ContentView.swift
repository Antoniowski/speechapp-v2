//
//  ContentView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var searchText = ""
    
    var body: some View{
        NavigationView{
            TabView{
                FavouritesView()
                    .tabItem{
                        Label("Favorites", systemImage: "star")
                    }
            }
            .navigationTitle("Favorites")
            .navigationBarItems(leading:
                    HStack {
                        //left
                    },          trailing:
                    HStack {
                        Button(action: {
                            //do
                        }, label: {
                            Image(systemName: "plus")
                        })
                    })
        }
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

struct Preview: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
