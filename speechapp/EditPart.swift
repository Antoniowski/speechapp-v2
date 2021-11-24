//
//  EditPart.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI

struct EditPart: View{
    @EnvironmentObject var data: DataHandler
    @Environment(\.dismiss) private var dismiss
    
    var speech: Speech
    var part: Part = Part(title: "", type: .mid, color: fcPink)
    
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var partType: PartType = .mid
    @State var color: Color = fcPink
    
    var body: some View{
        VStack {
            RoundedRectangle(cornerRadius: cornerRad)
                .fill(color)
                .frame(width: UIScreen.main.bounds.height*0.1, height: UIScreen.main.bounds.height*0.1)
                .padding()
                .padding(.top)
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
        }
        .background(Color.init(uiColor: UIColor.secondarySystemBackground))
        .toolbar{navigationBarItems}
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                if title != "" {
                    if data.SearchPart(title: title) == false {
                        data.AppendNewPart(speech: speech, part: Part(title: title, subtitle: subtitle, type: partType, color: color, cards: []))
                    } else {
                        data.EditPartInfo(speech: speech, title: title, subtitle: subtitle, type: partType, color: color, flashcards: part.cards)
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

