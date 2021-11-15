//
//  ContentView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var ciao = ""
    var body: some View{
        NavigationView{
            TabView{
                FavoritesView()
                    .tabItem{
                        Label("Favorites", systemImage: "star")

                    }
            }
            .navigationTitle("Recents")
            .toolbar{
                Button(action: {print("hello")}){
                    Image(systemName: "plus")
                }
            }
            
        }
        .searchable(text: $ciao, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct ciao: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
