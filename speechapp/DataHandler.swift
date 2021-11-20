
import SwiftUI

class DataHandler{
    private var contenitore: [Speech]
    
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
}

//TEST
var dati = DataHandler(speeches: mySpeeches)
