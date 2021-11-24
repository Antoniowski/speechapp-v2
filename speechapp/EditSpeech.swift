//
//  EditSpeech.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI


struct EditSpeech: View{
    @EnvironmentObject var data: DataHandler
    @Environment(\.dismiss) private var dismiss
    
    var speech: Speech = Speech()
    @State var title: String = ""
    @State var symbol: String = "mic"
        
    var body: some View{
        VStack {
            ZStack{
            RoundedRectangle(cornerRadius: cornerRad)
                .fill(.quaternary)
                .frame(width: UIScreen.main.bounds.height*0.1, height: UIScreen.main.bounds.height*0.1)
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundColor(.white)
            }
            .padding()
            .padding(.top)
        Form{
            Section("Speech Title"){
                TextField("Title", text: $title)
                
            }
            Section("Symbol"){
                SymbolPicker(chosenSymbol: $symbol)
            }
        }
        }
        .background(Color.init(uiColor: UIColor.secondarySystemBackground))
        .toolbar{navigationBarItems}
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                if title != "" {
                    if speech.title == "" {
                        data.AppendNewSpeech(speech: Speech(title: title, symbol: symbol, isFavorite: false, parts: []))
                    } else {
                        data.EditSpeechInfo(oldTitle: speech.title, title: title, symbol: symbol, favorite: speech.isFavorite, parts: speech.parts)
                    }
                }
                dismiss()
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}
