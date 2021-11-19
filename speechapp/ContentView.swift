//
//  ContentView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var tabSelection = 0
    @State private var searchText = ""
    
    var body: some View{
        NavigationView{
            TabView(selection: $tabSelection){
                RecentsView(searchText: $searchText)
                    .tabItem{
                        Label("Recents", systemImage: "clock.fill")
                    }
                    .tag(0)
                FavoritesView(searchText: $searchText)
                    .tabItem{
                        Label("Favorites", systemImage: "star")
                    }
                    .tag(1)
            }
            .navigationTitle(navigationBarTitle)
            .navigationBarHidden(navigationBarHidden)
            .navigationBarItems(trailing: navigationBarTrailingItems)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }.accentColor(appAccentColor)
    }
}

private extension ContentView {
    var navigationBarTitle: String {
        tabSelection == 0 ? "Recents" : "Favorites"
    }
    
    var navigationBarHidden: Bool {
        tabSelection == 2
    }

    @ViewBuilder
    var navigationBarTrailingItems: some View {
        if tabSelection < 2 {
            HStack {
                Button(action: {
                    //do
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
    }
}

struct Preview: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
