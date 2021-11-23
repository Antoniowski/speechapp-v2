//
//  EditSpeech.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI


struct AddSpeech: View{
    @ObservedObject var data: DataHandler
    
    @Environment(\.dismiss) private var dismiss
    @State var title: String = ""
    @State var symbol: String = "" // set default
        
    var body: some View{
        List{
            Section("Speech Title"){
                TextField("Title", text: $title)
                
            }
            Section("Symbol"){
                ColorPickerGrid()
                    .frame(height: 200)
            }
        }
        .toolbar{navigationBarItems}
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                if title != "" {
                    data.AppendNewSpeech(speech: Speech(title: title, symbol: "gear", isFavorite: false, parts: []))
                }
                dismiss()
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}
