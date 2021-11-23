//
//  EditPart.swift
//  speechapp
//
//  Created by Antonio Romano on 23/11/21.
//

import SwiftUI

struct EditPart: View{
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var partType: PartType = .mid
    @State var color: Color = .black
    
    var speech: Speech
    
    var body: some View{
        List{
            Section("Generic infos"){
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                
            }
            Section("Type"){
                HStack(alignment: .center, spacing: 20){
                    Button(action: {
                        partType = .start
                    }, label: {
                        Label("start", systemImage: "")
                    })
                    Button(action: {
                        partType = .mid
                    }, label: {
                        Label("mid", systemImage: "")

                    })
                    Button(action: {
                        partType = .end
                    }, label: {
                        Label("end", systemImage: "")
                    })
                }
                .padding(.horizontal)
                
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
            }, label: {
                Text("Done")
            })
        }
        .padding()
    }
}


