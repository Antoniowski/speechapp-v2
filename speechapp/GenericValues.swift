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


// Data Handling
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

struct Section: Hashable {
    var title: String
    var subtitle: String
    var color: Color
    var cards: [Flashcard]
    
    init(title: String, subtitle: String = "", color: Color, cards: [Flashcard]) {
        self.title = title
        self.subtitle = subtitle
        self.color = color
        self.cards = cards
    }
}

struct Speech: Hashable{
    var title: String
    var symbol: String
    var isFavorite: Bool
    var sections: [Section]
    var flashcards: [Flashcard]
    
    init(title: String, symbol: String, isFavorite: Bool = false, sections: [Section]){
        self.title = title
        self.symbol = symbol
        self.isFavorite = isFavorite
        self.sections = sections
        var f = [Flashcard]()
        for section in sections {
            f.append(contentsOf: section.cards)
        }
        self.flashcards = f
    }
}


// Example Data

var genIntroduction = Section(title: "Introduction", subtitle: "Where it started", color: .orange, cards: [
    Flashcard(title: "Intro 1", symbol: "app", color: .orange, description: "Lorem ipsum"),
    Flashcard(title: "Intro 2", symbol: "app", color: .orange, description: "Lorem ipsum")
])

var genBody = Section(title: "Body", subtitle: "How we did it", color: .green, cards: [
    Flashcard(title: "Body 1", symbol: "app", color: .green, description: "Lorem ipsum"),
    Flashcard(title: "Body 2", symbol: "app", color: .green, description: "Lorem ipsum"),
    Flashcard(title: "Body 3", symbol: "app", color: .green, description: "Lorem ipsum")
])

var genConclusion = Section(title: "Conclusion", subtitle: "We hope you like it!", color: .blue, cards: [
    Flashcard(title: "Conclusion 1", symbol: "app", color: .blue, description: "Lorem ipsum"),
    Flashcard(title: "Conclusion 2", symbol: "app", color: .blue, description: "Lorem ipsum")
])

var introduction = Section(title: "Introduction", subtitle: "Where it started", color: .orange, cards: [
    Flashcard(title: "The Big Idea", symbol: "apps.iphone", color: .orange, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub"),
    Flashcard(title: "App Concept", symbol: "speaker.circle", color: .orange, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub")
])

var body = Section(title: "Body", subtitle: "How we did it", color: .green, cards: [
    Flashcard(title: "Solution Concept", symbol: "bag", color: .green, description: "Lorem ipsum"),
    Flashcard(title: "App Development", symbol: "app.dashed", color: .green, description: "Lorem ipsum"),
    Flashcard(title: "Bug Fixes", symbol: "bandage", color: .green, description: "Lorem ipsum")
])

var conclusion = Section(title: "Conclusion", subtitle: "We hope you like it!", color: .blue, cards: [
    Flashcard(title: "App Store", symbol: "bag", color: .blue, description: "Lorem ipsum"),
    Flashcard(title: "Goodbye", symbol: "hand.wave", color: .blue, description: "Lorem ipsum")
])

var sections = [genIntroduction, genBody, genConclusion]

var mySpeeches = [
    Speech(title: "My App", symbol: "apps.iphone", isFavorite: true, sections: [introduction, body, conclusion]),
    Speech(title: "Electricity", symbol: "bolt.fill", isFavorite: true, sections: sections),
    Speech(title: "The power of 3d", symbol: "rotate.3d", sections: sections),
    Speech(title: "Ecology", symbol: "leaf.fill", sections: sections),
    Speech(title: "Health", symbol: "facemask.fill", sections: sections),
    Speech(title: "Bikes", symbol: "bicycle", sections: sections),
    Speech(title: "Think creatively", symbol: "brain.head.profile", isFavorite: true, sections: sections),
    Speech(title: "Electric Cars", symbol: "car.fill", isFavorite: true, sections: sections),
    Speech(title: "Music and life", symbol: "music.note", sections: sections),
    Speech(title: "Save the planet", symbol: "globe.europe.africa.fill", isFavorite: true, sections: sections),
    Speech(title: "The Water Cycle", symbol: "drop.fill", sections: sections),
    Speech(title: "My Favourite Book", symbol: "book.closed.fill", sections: sections),
    Speech(title: "User Experience", symbol: "person.fill", isFavorite: true, sections: sections),
    Speech(title: "Sleeping well", symbol: "bed.double.fill", isFavorite: true, sections: sections),
    Speech(title: "Fairytales", symbol: "book.fill", sections: sections)
]
