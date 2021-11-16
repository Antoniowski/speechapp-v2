//
//  ContentView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View{
        TabView{
            RecentsView()
                .tabItem{
                    Label("Recents", systemImage: "clock.fill")
                }
            FavoritesView()
                .tabItem{
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

struct Preview: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}