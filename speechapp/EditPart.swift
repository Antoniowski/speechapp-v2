//
//  EditPart.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI

struct EditPart: View{
    @ObservedObject var data: DataHandler
    var speech: Speech
    
    @Environment(\.dismiss) private var dismiss
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var partType: PartType = .mid
    @State var color: Color = fcPink
    
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
                ColorPicker(chosenColor: $color)
            }
        }
        .toolbar{navigationBarItems}
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                if title != "" {
                    data.AppendNewPart(speech: speech, part: Part(title: title, subtitle: subtitle, type: partType, color: color, cards: []))
                }
                dismiss()
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}

