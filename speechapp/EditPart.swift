//
//  EditPart.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI

struct EditPart: View{
    @ObservedObject var data: DataHandler
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var partType: PartType = .mid
    @State var color: Color = .black

    var speech: Speech
    
    var body: some View{
        Form{
            Section("Section info"){
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                
            }
            Section("Type"){
                Picker("Type", selection: $partType){
                    Text("Beginning").tag(PartType.start)
                    Text("Body").tag(PartType.mid)
                    Text("End").tag(PartType.end)
                }
                .pickerStyle(.segmented)
                .padding()
            }
            Section("Color"){
                ColorPickerGrid()
                    .frame(height: 200)
            }
        }
        .navigationBarItems(trailing: navigationBarTrailingItems)
    }
}

private extension EditPart {
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack{
            Button(action: {
                data.AppendNewPart(speech: speech, part: Part(title: title, subtitle: subtitle, type: .mid, color: color, cards: []))
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}

