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
let flashcardScale = Scale(height: 0.75, width: 0.80, padding: 0.04, imageSize: 0.3)


// Colors
let appAccentColor: Color = Color("appAccent")
let primaryColor: Color = Color("appPrimary")
let secondaryColor: Color = Color("appSecondary")
let tertiaryColor: Color = Color("appTertiary")

let fcAcquamarine: Color = Color("flashCardAquamarine")
let fcBlue: Color = Color("flashCardBluePigment")
let fcGreenA: Color = Color("flashCardGreenA")
let fcGreenB: Color = Color("flashCardGreenB")
let fcIndigo: Color = Color("flashCardIndigo")
let fcMagenta: Color = Color("flashCardMagenta")
let fcOrangeA: Color = Color("flashCardOrangeA")
let fcOrangeB: Color = Color("flashCardOrangeB")
let fcPink: Color = Color("flashCardPink")
let fcPurple: Color = Color("flashCardPurple")
let fcSteelBlue: Color = Color("flashCardSteelBlue")
let fcYellow: Color = Color("flashCardYellow")

var colorArray: [Color] = [fcPink, fcMagenta, fcOrangeA, fcOrangeB, fcYellow, fcGreenA, fcGreenB, fcAcquamarine, fcSteelBlue, fcPurple, fcBlue, fcIndigo]

// Symbols
var symbolArray: [String] =
[ "mic.fill", "message.fill", "bubble.left.and.bubble.right.fill", "sun.max.fill", "moon.fill", "sparkles",
  "smoke.fill", "wind", "snowflake", "tornado", "pencil", "paperplane.fill",
  "archivebox.fill", "doc.fill", "book.fill", "books.vertical.fill", "book.closed.fill", "magazine.fill",
  "bookmark.fill", "paperclip", "umbrella.fill", "speaker.wave.3.fill", "music.mic", "flag.fill",
  "bell.fill", "tag.fill", "eyeglasses", "facemask.fill", "flashlight.off.fill", "camera.fill",
  "gearshape.2.fill", "scissors", "wand.and.rays", "gyroscope", "speedometer", "dice.fill",
  "apps.iphone", "bolt.fill", "rotate.3d", "leaf.fill", "bicycle", "brain.head.profile",
  "car.fill", "music.note", "globe.europe.africa.fill", "drop.fill", "person.fill", "bed.double.fill" ]


// Data Handling
enum PartType {
    case start, mid, end
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

struct Part: Hashable {
    var title: String
    var subtitle: String
    var type: PartType
    var color: Color
    var cards: [Flashcard]
    
    init(title: String, subtitle: String = "", type: PartType, color: Color, cards: [Flashcard] = []) {
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.color = color
        self.cards = cards
    }
}

struct Speech: Hashable{
    var title: String
    var symbol: String
    var isFavorite: Bool
    var parts: [Part]
    
    init(title: String = "", symbol: String = "", isFavorite: Bool = false, parts: [Part] = []){
        self.title = title
        self.symbol = symbol
        self.isFavorite = isFavorite
        self.parts = parts
    }
    
    func isEmpty() -> Bool {
        if self.title == "" && self.symbol == "" {
            return true
        } else {
            return false
        }
    }
    
    func getAllFlashcards() -> [Flashcard] {
        var f = [Flashcard]()
        for part in parts {
            f.append(contentsOf: part.cards)
        }
        return f
    }
}

let infoText = [
    [Text("In this section, state the topic of your speech."), Text("Try to follow these questions:\n**- What is the main topic of your speech?\n- Why should the audience listen to your speech?\n- What will your main points be?**")],
    [Text("In this section, try to get to the heart of your speech"), Text("Try to follow these tips:\n**- Focus on a maximum of three points\n- Emotionally engage your audience\n- Don't make sentences too long\n- Do not use technical terms unless you are sure they can be understood**")],
    [Text("In this section, you get to the ending of your speech."), Text("For a memorable ending, remember these tips:\n**- Summarize the main message and get the audience's attention.\n- Call the audience to action and conclude with a greeting and thank you that reinforce the message.**")]
]

// Example Data

var genIntroduction = Part(title: "Introduction", subtitle: "Where it started", type: .start, color: fcPink, cards: [
    Flashcard(title: "Intro 1", symbol: "app", color: fcPink, description: "Lorem ipsum"),
    Flashcard(title: "Intro 2", symbol: "app", color: fcPink, description: "Lorem ipsum")
])

var genBody = Part(title: "Body", subtitle: "How we did it", type: .mid, color: .green, cards: [
    Flashcard(title: "Body 1", symbol: "app", color: fcSteelBlue, description: "Lorem ipsum"),
    Flashcard(title: "Body 2", symbol: "app", color: fcSteelBlue, description: "Lorem ipsum"),
    Flashcard(title: "Body 3", symbol: "app", color: fcSteelBlue, description: "Lorem ipsum")
])

var genConclusion = Part(title: "Conclusion", subtitle: "We hope you like it!", type: .end, color: fcOrangeA, cards: [
    Flashcard(title: "Conclusion 1", symbol: "app", color: fcOrangeA, description: "Lorem ipsum"),
    Flashcard(title: "Conclusion 2", symbol: "app", color: fcOrangeA, description: "Lorem ipsum")
])

var introduction = Part(title: "Introduction", subtitle: "Where it started", type: .start, color: fcYellow, cards: [
    Flashcard(title: "The Big Idea", symbol: "apps.iphone", color: fcYellow, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub"),
    Flashcard(title: "App Concept", symbol: "speaker.circle", color: fcYellow, description: "Loreipsumdashgdatydajdgayudbadyusafuyashfbyugsdafuygsafygasfgsafyasgfasfasgfcayfascasfasub")
])

var body = Part(title: "Body", subtitle: "How we did it", type: .mid, color: fcPurple, cards: [
    Flashcard(title: "Solution Concept", symbol: "bag", color: fcPurple, description: "Lorem ipsum"),
    Flashcard(title: "App Development", symbol: "app.dashed", color: fcPurple, description: "Lorem ipsum"),
    Flashcard(title: "Bug Fixes", symbol: "bandage", color: fcPurple, description: "Lorem ipsum")
])

var conclusion = Part(title: "Conclusion", subtitle: "We hope you like it!", type: .end, color: fcGreenB, cards: [
    Flashcard(title: "App Store", symbol: "bag", color: fcGreenB, description: "Lorem ipsum"),
    Flashcard(title: "Goodbye", symbol: "hand.wave", color: fcGreenB, description: "Lorem ipsum")
])

var parts = [genIntroduction, genBody, genConclusion]

var mySpeeches = [
    Speech(title: "My App", symbol: "apps.iphone", isFavorite: true, parts: [introduction, body, conclusion]),
    Speech(title: "Electricity", symbol: "bolt.fill", isFavorite: true, parts: parts),
    Speech(title: "The power of 3d", symbol: "rotate.3d", parts: parts),
    Speech(title: "Ecology", symbol: "leaf.fill", parts: parts),
    Speech(title: "Health", symbol: "facemask.fill", parts: parts),
    Speech(title: "Bikes", symbol: "bicycle", parts: parts),
    Speech(title: "Think creatively", symbol: "brain.head.profile", isFavorite: true, parts: parts),
    Speech(title: "Electric Cars", symbol: "car.fill", isFavorite: true, parts: parts),
    Speech(title: "Music and life", symbol: "music.note", parts: parts),
    Speech(title: "Save the planet", symbol: "globe.europe.africa.fill", isFavorite: true, parts: parts),
    Speech(title: "The Water Cycle", symbol: "drop.fill", parts: parts),
    Speech(title: "My Favourite Book", symbol: "book.closed.fill", parts: parts),
    Speech(title: "User Experience", symbol: "person.fill", isFavorite: true, parts: parts),
    Speech(title: "Sleeping well", symbol: "bed.double.fill", isFavorite: true, parts: parts),
    Speech(title: "Fairytales", symbol: "book.fill", parts: parts)
]
