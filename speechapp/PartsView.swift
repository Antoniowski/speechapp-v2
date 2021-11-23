//
//  SettingsView.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 16/11/21.
//

import SwiftUI

struct PartsView: View {
    @ObservedObject var data: DataHandler
    @State var isPresented = false
    @State var isShowingEditPart = false
    @State var isShowingAddPart = false
    var speech: Speech

    var body: some View {
        List{
            ForEach(speech.parts, id: \.self){ part in
                NavigationLink(destination: {
                    FlashcardsView(data: data,speech: speech,  part: part)
                }, label: {
                    ButtonPartsStyle(part: part)
                })
                    .swipeActions(content: {
                        Button("Delete"){
                            data.RemovePart(speech: speech, part: part)
                        }
                        .tint(.red)
                        
                        Button("Edit"){
                            isShowingEditPart.toggle()
                        }
                        .sheet(isPresented: $isShowingEditPart){
                            NavigationView{
                                EditPart(data: data, speech: speech, title: part.title, subtitle: part.subtitle, partType: part.type, color: part.color)
                                    .navigationBarTitle("Edit Part")
                            }
                        }
                        .tint(Color(white: 0.7, opacity: 1))
                    })
            }
        }
        .navigationTitle(speech.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{navigationBarItems}
    }
    
    @ViewBuilder
    var navigationBarItems: some View {
        HStack{
            Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "play.fill")
            })
                .fullScreenCover(isPresented: $isPresented) {
                    PresentationView(speech: speech)                }
            Button(action: {
                isShowingAddPart.toggle()
            }, label: {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $isShowingAddPart) {
                    NavigationView{
                        EditPart(data: data, speech: speech)
                            .navigationTitle("Add Section")
                    }
                }
        }
    }
}


struct ButtonPartsStyle: View{
    var part: Part
    
    var body: some View{
            VStack(alignment:.leading){
                Text(part.title)
                    .bold()
                Text(part.subtitle)
                    .foregroundColor(.secondary)
            }.padding(.vertical)
    }
}
