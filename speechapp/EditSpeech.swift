//
//  EditSpeech.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI


struct AddSpeech: View{
    @ObservedObject var data: DataHandler
    
    @State var title: String = ""
    @State var symbol: String = ""
        
    var body: some View{
        List{
            Section("Generic infos"){
                TextField("Title", text: $title)
                
            }
            Section("Symbol"){
                ColorPickerGrid()
                    .frame(height: 200)
            }
        }
        .navigationBarItems(trailing: navigationBarTrailingItems)
    }
}

private extension AddSpeech {
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack{
            Button(action: {
                data.AppendNewSpeech(speech: Speech(title: title, symbol: "gear", isFavorite: false, parts: []))
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}
