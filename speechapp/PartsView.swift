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
    @State var showCreation = false
    var speech: Speech

    var body: some View {
        List{
            ForEach(speech.parts, id: \.self){ part in
                NavigationLink(destination: {
                    FlashcardsView(data: data,speech: speech,  part: part)
                }, label: {
                    ButtonPartsStyle(part: part)
                })
            }
        }
        .navigationTitle(speech.title)
        .navigationBarItems(trailing: navigationBarTrailingItems)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension PartsView {
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack{
            Button(action: {
                isPresented.toggle()
            }, label: {
                Image(systemName: "play.fill")
            })
                .fullScreenCover(isPresented: $isPresented) {
                    PresentationView(speech: speech)
                        .accentColor(appAccentColor)
                }
            Button(action: {
                showCreation.toggle()
            }, label: {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showCreation) {
                    NavigationView{
                        EditPart(data: data, speech: speech)
                            .navigationTitle("Edit")
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
