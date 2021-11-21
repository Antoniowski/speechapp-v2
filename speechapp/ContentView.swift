//
//  ContentView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var datas: DataHandler
    @State private var searchText = ""
    
    var body: some View{
        TabView{
                RecentsViewNav(datas: datas, searchText: $searchText) //RECENT1 CHANGE TO DEFINITIVE
                .tabItem{
                    Label("Recents", systemImage: "clock.fill")
                }
            FavoritesViewNav(searchText: $searchText)
                .tabItem{
                    Label("Favorites", systemImage: "star")
                }
        }.accentColor(appAccentColor)
    }
}

struct RecentsViewNav: View {
    @ObservedObject var datas: DataHandler
    @Binding var searchText: String
    
    var body: some View {
        NavigationView {
            RecentsView1(dati: datas, searchText: $searchText) //RECENT1 CHANGE TO DEFINITIVE
                .navigationTitle("Recents")
                .navigationBarTitleDisplayMode(.automatic)
                .navigationBarItems(trailing: navigationBarTrailingItems)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack {
            Button(action: {
                //do
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}

struct FavoritesViewNav: View {
    @Binding var searchText: String
    
    var body: some View {
        NavigationView {
            FavoritesView(searchText: $searchText)
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
                //do
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}
