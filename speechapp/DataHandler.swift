
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
            self.contenitore[index].parts.insert(part, at: (self.contenitore[index].parts.count-1))
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
}

//TEST
//var dati = DataHandler(speeches: mySpeeches)
