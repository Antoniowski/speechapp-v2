
import SwiftUI

class DataHandler: ObservableObject{
    @Published private var contenitore: [Speech]
    
    init(){
        self.contenitore = []
    }
    
    init(speeches: [Speech]){
        self.contenitore = speeches
    }
    
    func GetAllSpechees()->[Speech]{return self.contenitore}
    func AppendNewSpeech(speech: Speech){self.contenitore.append(speech)}
    
    func ToggleFavorite(speech: Speech){
        var index = 0
        while(self.contenitore[index].title != speech.title){
            index += 1
        }
        self.contenitore[index].isFavorite.toggle()
    }
    
    func AppendNewPart(speech: Speech, part: Part){
        var index = 0
        while(self.contenitore[index].title != speech.title){
            index += 1
        }
        
        switch part.type {
        case .start:
            self.contenitore[index].parts.insert(part, at: 0)
        case .mid:
            if self.contenitore[index].parts.last?.type == .end {
                self.contenitore[index].parts.insert(part, at: self.contenitore[index].parts.count-1)
            } else {
                self.contenitore[index].parts.insert(part, at: self.contenitore[index].parts.count)
            }
        case .end:
            self.contenitore[index].parts.append(part)
        }
        
    }
    
    func AppendNewFlashcard(speech: Speech, part: Part, flashcard: Flashcard){
        var indexSpeech = 0
        var indexPart = 0
        while(self.contenitore[indexSpeech].title != speech.title){
            indexSpeech += 1
        }
        
        while(self.contenitore[indexSpeech].parts[indexPart].title != part.title){
            indexPart += 1
        }
        
        self.contenitore[indexSpeech].parts[indexPart].cards.append(flashcard)
    }
    
    func RemoveSpeech(speech: Speech){
        var index = 0
        while(self.contenitore[index].title != speech.title){
            index += 1
        }
        self.contenitore.remove(at: index)
    }
    
    func RemovePart(speech: Speech, part: Part){
        var indexSpeech = 0
        var indexPart = 0
        while(self.contenitore[indexSpeech].title != speech.title){
            indexSpeech += 1
        }
        while(self.contenitore[indexSpeech].parts[indexPart].title != part.title){
            indexPart += 1
        }
        self.contenitore[indexSpeech].parts.remove(at: indexPart)
    }
    
    func RemoveFlashcard(speech: Speech, part: Part, flashcard: Flashcard){
        var indexSpeech = 0
        var indexPart = 0
        var indexFlash = 0
        while(self.contenitore[indexSpeech].title != speech.title){
            indexSpeech += 1
        }
        while(self.contenitore[indexSpeech].parts[indexPart].title != part.title){
            indexPart += 1
        }
        while(self.contenitore[indexSpeech].parts[indexPart].cards[indexFlash].title != flashcard.title){
            indexFlash += 1
        }
        
        self.contenitore[indexSpeech].parts[indexPart].cards.remove(at: indexFlash)
    }
    
    func SearchFlashcard(title: String)->Bool{
        var isThere: Bool = false
        for indexS in (0...contenitore.count-1){
            for indexP in (0...self.contenitore[indexS].parts.count-1){
                for indexF in (0...self.contenitore[indexS].parts[indexP].cards.count-1){
                    if (self.contenitore[indexS].parts[indexP].cards[indexF].title == title){
                        isThere = true
                    }
                }
               
            }
        }
        return isThere
    }
    
    func SearchPart(title: String)->Bool{
        var isThere: Bool = false
        for indexS in (0...contenitore.count-1){
            for indexP in (0...self.contenitore[indexS].parts.count-1){
                if (self.contenitore[indexS].parts[indexP].title == title){
                    isThere = true
                }
            }
        }
        return isThere
    }
    
    func SearchSpeech(title: String)->Bool{
        var isThere: Bool = false
        for indexS in (0...contenitore.count-1){
            if (self.contenitore[indexS].title == title){
                isThere = true
            }
        }
        return isThere
    }
    
    func EditFlashInfo(speech: Speech, part: Part, oldTitle: String, title: String, symbol: String, color: Color, description: String){
        var indexSpeech = 0
        var indexPart = 0
        var indexFlash = 0
        while(self.contenitore[indexSpeech].title != speech.title){
            indexSpeech += 1
        }
        while(self.contenitore[indexSpeech].parts[indexPart].title != part.title){
            indexPart += 1
        }
        while(self.contenitore[indexSpeech].parts[indexPart].cards[indexFlash].title != oldTitle){
            indexFlash += 1
        }
        self.contenitore[indexSpeech].parts[indexPart].cards[indexFlash].title = title
        self.contenitore[indexSpeech].parts[indexPart].cards[indexFlash].symbol = symbol
        self.contenitore[indexSpeech].parts[indexPart].cards[indexFlash].color = color
        self.contenitore[indexSpeech].parts[indexPart].cards[indexFlash].description = description
    }
    
    func EditPartInfo(speech: Speech, oldTitle: String, title: String, subtitle: String, type: PartType, color: Color, flashcards:[Flashcard] ){
        var indexSpeech = 0
        var indexPart = 0
        while(self.contenitore[indexSpeech].title != speech.title){
            indexSpeech += 1
        }
        while(self.contenitore[indexSpeech].parts[indexPart].title != oldTitle){
            indexPart += 1
        }
        self.contenitore[indexSpeech].parts[indexPart].title = title
        self.contenitore[indexSpeech].parts[indexPart].subtitle = subtitle
        self.contenitore[indexSpeech].parts[indexPart].type = type
        self.contenitore[indexSpeech].parts[indexPart].color = color
        self.contenitore[indexSpeech].parts[indexPart].cards = flashcards
        for x in (0...self.contenitore[indexSpeech].parts[indexPart].cards.count-1){
            self.contenitore[indexSpeech].parts[indexPart].cards[x].color = color
        }

    }
    
    func EditSpeechInfo(oldTitle: String, title: String, symbol: String, favorite: Bool, parts: [Part]){
        var indexSpeech = 0

        while(self.contenitore[indexSpeech].title != oldTitle){
            indexSpeech += 1
        }
        self.contenitore[indexSpeech].title = title
        self.contenitore[indexSpeech].symbol = symbol
        self.contenitore[indexSpeech].isFavorite = favorite
        self.contenitore[indexSpeech].parts = parts

    }
}



