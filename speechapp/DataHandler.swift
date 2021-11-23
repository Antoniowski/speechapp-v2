
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
    func RemoveSpeech(speech: Speech){
        var index = 0
        while(self.contenitore[index].title != speech.title){
            index += 1
        }
        self.contenitore.remove(at: index)
    }
    
    func AppendNewPart(speech: Speech, part: Part){
        var index = 0
        while(self.contenitore[index].title != speech.title){
            index += 1
        }
        self.contenitore[index].parts.append(part)
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
}

//TEST
//var dati = DataHandler(speeches: mySpeeches)
