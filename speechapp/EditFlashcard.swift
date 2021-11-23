//
//  FlashcardModifyView.swift
//  speechapp
//
//  Created by Antonio Romano on 21/11/21.
//

import SwiftUI

struct EditFlashcard: View{
    @ObservedObject var data: DataHandler
    var speech: Speech
    var part: Part
    
    @Environment(\.dismiss) private var dismiss
    @State var title: String = ""
    @State var description: String = ""
    @State var symbol: String = "gear"
    
    var body: some View{
            List{
                Section("Title"){
                    TextField("Title", text: $title)
                        .font(.system(.title))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height/10)
                }
                
                Section("Content"){
                    TextEditor(text: $description)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 40, maxHeight: UIScreen.main.bounds.height*0.30)
                }
                
                Section("Symbol"){
                    
                }
            }
            .toolbar{ navigationBarItems}
            .padding()
        }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                if title != "" {
                data.AppendNewFlashcard(speech: speech, part: part, flashcard: Flashcard(title: title, symbol: symbol, color: part.color, description: description))
                }
                dismiss()
            }, label: {
                Text("Save")
            })
        }
        .padding()
    }
}
