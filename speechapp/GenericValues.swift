//
//  GenericValues.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

//GENERIC VALUES DA USARE
let cornerRad: CGFloat = 20

struct mostRecentScale{
    let height = 0.27
    let width = 0.90
    let padding = 0.04
}

struct recentsScale{
    let width = 0.28
    let padding = 0.04
}

struct favoritesScale{
    let width = 0.44
    let padding = 0.04
    let imageSize = 0.15
}

//PER CLAUDIO
let primaryAppColor: Color = .blue
let secondaryAppColor: Color =  .gray




//EXAMPLE VARIABLES
struct Speech: Hashable{
    var title: String
    var symbol: String
    var color: Color
    var isFavorite: Bool
    //var cardText: String
    
    init(title: String, symbol: String, color: Color, isFavorite: Bool = false){
        self.title = title
        self.symbol = symbol
        self.color = color
        self.isFavorite = isFavorite
    }
}

var mySpeeches = [
    Speech(title: "My App", symbol: "apps.iphone", color: .orange, isFavorite: true),
    Speech(title: "Electricity", symbol: "bolt.fill", color: .blue, isFavorite: true),
    Speech(title: "The power of 3d", symbol: "rotate.3d", color: .teal),
    Speech(title: "Ecology", symbol: "leaf.fill", color: .green),
    Speech(title: "Health", symbol: "facemask.fill", color: .red),
    Speech(title: "Bikes", symbol: "bicycle", color: .purple),
    Speech(title: "Think creatively", symbol: "brain.head.profile", color: .pink, isFavorite: true),
    Speech(title: "Electric Cars", symbol: "car.fill", color: .yellow, isFavorite: true),
    Speech(title: "Music and life", symbol: "music.note", color: .blue),
    Speech(title: "Save the planet", symbol: "globe.europe.africa.fill", color: .green, isFavorite: true),
    Speech(title: "The Water Cycle", symbol: "drop.fill", color: .indigo),
    Speech(title: "My Favourite Book", symbol: "book.closed.fill", color: .orange),
    Speech(title: "User Experience", symbol: "person.fill", color: .teal, isFavorite: true),
    Speech(title: "Sleeping well", symbol: "bed.double.fill", color: .purple, isFavorite: true),
    Speech(title: "Fairytales", symbol: "book.fill", color: .red)
]
