//
//  DataHandler.swift
//  speechapp
//
//  Created by Antonio Romano on 19/11/21.
//

import Foundation
import SwiftUI
//PROTOCOLS

protocol Colored{
    var color: Color {get set}
}





class DataHandler{
    private var speeches: [Speech] = []
    
    init(newData: [Speech]){
        self.speeches = newData
    }
    
    func GetData()->[Speech]{return self.speeches}
    func AppendSpeeches(newSpeech: Speech){self.speeches.append(newSpeech)}
    
    
}

struct SpeechV2{
    var title: String = ""
    var symbol: String = ""
    var isFavorite: Bool = false
    var sections: [Section] = []
    var flashcards: [FlashcardV2] = []
    
    init(title: String, symbol: String, isFavorite: Bool = false, sections: [Section], flashcard: [FlashcardV2] = []){
        self.title = title
        self.symbol = symbol
        self.isFavorite = isFavorite
        self.sections = sections
        self.flashcards = flashcard
    }
}

struct SectionV2 {
    var title: String = ""
    @State var color: Color = primaryColor
    
    init(title: String, subtitle: String = "", color: Color) {
        self.title = title
        self.color = color
    }
}

struct FlashcardV2{
    var title: String = ""
    var symbol: String = ""
    @Binding var color: Color
    var description: String = ""
    var section: SectionV2 = SectionV2(title: "", color: primaryColor)
    
    init(title: String, symbol: String, color: Binding<Color>, description: String, section: SectionV2){
        self.title = title
        self.symbol = symbol
        self._color = color
        self.description = description
        self.section = section
    }
}

