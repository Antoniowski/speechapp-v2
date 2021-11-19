
import SwiftUI

class DataHandler{
    private var contenitore: [Speech]
    
    init(){
        self.contenitore = []
    }
    
    init(specches: [Speech]){
        self.contenitore = specches
    }
    
    func GetAllSpechees()->[Speech]{return self.contenitore}
    func AppendNewSpeech(speech: Speech){self.contenitore.append(speech)}
}

//TEST
var dati = DataHandler(specches: mySpeeches)
