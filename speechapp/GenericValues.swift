//
//  GenericValues.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

//GENERIC VALUES DA USARE
let cornerRad: CGFloat = 8

struct Scale {
    let height: Double
    let width: Double
    let padding: Double
    let imageSize: Double
}

let mostRecentsScale = Scale(height: 0.40, width: 1, padding: 0.04, imageSize: 0.20)
let recentsScale = Scale(height: 0.28, width: 0.28, padding: 0.04, imageSize: 0.10)
let favoritesScale = Scale(height: 0.44, width: 0.44, padding: 0.04, imageSize: 0.15)
let flashcardPreviewScale = Scale(height: 0.5, width: 0.28, padding: 0.05, imageSize: 0.2)
let flashcardScale = Scale(height: 0.88, width: 0.88, padding: 0.04, imageSize: 0.3)


let appAccentColor: Color = Color("appAccent")
let primaryColor: Color = Color("appPrimary")
let secondaryColor: Color = Color("appSecondary")
let tertiaryColor: Color = Color("appTertiary")


//EXAMPLE VARIABLES
struct Speech: Hashable{
    var title: String
    var symbol: String
    var isFavorite: Bool
    
    init(title: String, symbol: String, isFavorite: Bool = false){
        self.title = title
        self.symbol = symbol
        self.isFavorite = isFavorite
    }
}

struct Flashcard: Hashable{
    var title: String
    var symbol: String
    var color: Color
    var description: String
    
    init(title: String, symbol: String, color: Color, description: String){
        self.title = title
        self.symbol = symbol
        self.color = color
        self.description = description
    }
}

var mySpeeches = [
    Speech(title: "My App", symbol: "apps.iphone", isFavorite: true),
    Speech(title: "Electricity", symbol: "bolt.fill", isFavorite: true),
    Speech(title: "The power of 3d", symbol: "rotate.3d"),
    Speech(title: "Ecology", symbol: "leaf.fill"),
    Speech(title: "Health", symbol: "facemask.fill"),
    Speech(title: "Bikes", symbol: "bicycle"),
    Speech(title: "Think creatively", symbol: "brain.head.profile", isFavorite: true),
    Speech(title: "Electric Cars", symbol: "car.fill", isFavorite: true),
    Speech(title: "Music and life", symbol: "music.note"),
    Speech(title: "Save the planet", symbol: "globe.europe.africa.fill", isFavorite: true),
    Speech(title: "The Water Cycle", symbol: "drop.fill"),
    Speech(title: "My Favourite Book", symbol: "book.closed.fill"),
    Speech(title: "User Experience", symbol: "person.fill", isFavorite: true),
    Speech(title: "Sleeping well", symbol: "bed.double.fill", isFavorite: true),
    Speech(title: "Fairytales", symbol: "book.fill")
]

var myFlashcards = [
    Flashcard(title: "My App", symbol: "plus", color: .orange, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub"),
    Flashcard(title: "My App", symbol: "clock", color: .green, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub"),
    Flashcard(title: "My App", symbol: "gear", color: .blue, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub"),
    Flashcard(title: "My App", symbol: "apple.iphone", color: .gray, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub"),
    Flashcard(title: "My App", symbol: "apple.iphone", color: .yellow, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub")
]
