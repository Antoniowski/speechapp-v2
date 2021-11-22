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
        }.accentColor(appAccentColor)
    }
}

//Nav Views
private extension ContentView {
    var recentsView: some View {
        NavigationView {
            RecentsView(data: data, searchText: $searchText)
                .navigationTitle("Recents")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(trailing: navigationBarTrailingItems)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    var favoritesView: some View {
        NavigationView {
            FavoritesView(data: data, searchText: $searchText)
                .navigationTitle("Favorites")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(trailing: navigationBarTrailingItems)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack {
            Button(action: {
                showOnboarding.toggle()
            }, label: {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showOnboarding) {
                    OnboardingView()
                        .accentColor(appAccentColor)
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
