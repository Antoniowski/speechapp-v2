//
//  ContentView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI
import CoreData

//main content view

struct ContentView: View {
    @ObservedObject var data: DataHandler
    @State private var searchText = ""
    @State private var showOnboarding = false
    
    var body: some View{
        TabView{
            recentsView
                .tabItem{
                    Label("Recents", systemImage: "clock.fill")
                }
            favoritesView
                .tabItem{
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

//Nav Views
private extension ContentView {
    var recentsView: some View {
        NavigationView {
            RecentsView(data: data, searchText: $searchText)
                .navigationTitle("Recents")
                .navigationBarTitleDisplayMode(.automatic)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .toolbar{ navigationBarItems }
        }
    }
    var favoritesView: some View {
        NavigationView {
            FavoritesView(data: data, searchText: $searchText)
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.automatic)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .toolbar{ navigationBarItems }
        }
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack {
            Button(action: {
                showOnboarding.toggle()
            }, label: {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showOnboarding) {
                    NavigationView{
                        AddSpeech(data: data)
                            .navigationTitle("Add Speech")
                    }
                }
        }
    }
}

// preview

struct Content_Preview: PreviewProvider {
    static var previews: some View {
        ContentView(data: DataHandler(speeches: mySpeeches))
            
    }
}
