//
//  FlashcardModifyView.swift
//  speechapp
//
//  Created by Antonio Romano on 21/11/21.
//

import SwiftUI

struct EditFlashcard: View{
    @EnvironmentObject var data: DataHandler
    @Environment(\.dismiss) private var dismiss
    
    var speech: Speech
    var part: Part
    var card: Flashcard = Flashcard(title: "", symbol: "", color: fcPink, description: "")
    
    @State var title: String = ""
    @State var description: String = ""
    @State var symbol: String = "gearshape.2"
    
    var body: some View{
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: cornerRad)
                    .fill(part.color)
                    .frame(width: UIScreen.main.bounds.height*0.1, height: UIScreen.main.bounds.height*0.1)
                Image(systemName: symbol)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top)
            Form{
                Section("Title"){
                    TextField("Title", text: $title)
                        .font(.system(.title))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height/10)
                }
                
                Section("Content"){
                    TextEditor(text: $description)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 90, maxHeight: UIScreen.main.bounds.height*0.30)
                }
                Section("Symbol"){
                    SymbolPicker(chosenSymbol: $symbol)
                }
            }
        }
        .background(Color.init(uiColor: UIColor.secondarySystemBackground))
        .toolbar{ navigationBarItems }
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                if title != "" {
                    if card.title == "" {
                        data.AppendNewFlashcard(speech: speech, part: part, flashcard: Flashcard(title: title, symbol: symbol, color: part.color, description: description))
                    } else {
                        //                        do
                    }
                }
                dismiss()
            }, label: {
                Text("Save")
            })
        }
        .padding()
    }
}
