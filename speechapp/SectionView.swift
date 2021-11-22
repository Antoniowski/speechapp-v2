//
//  SettingsView.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 16/11/21.
//

import SwiftUI

struct SectionView: View {
    @State var isPresented = false
    var speech: Speech

    var body: some View {
        List{
            ForEach(speech.sections, id: \.self){ section in
                NavigationLink(destination: {
                    FlashcardsView(section: section)
                }, label: {
                    ButtonSectionStyle(section: section)
                })
            }
        }
        .navigationTitle(speech.title)
        .navigationBarItems(trailing: navigationBarTrailingItems)
        .navigationBarTitleDisplayMode(.inline)
    }
}

private extension SectionView {
    
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
//            .sheet(isPresented:) {}
            }, label: {
                Image(systemName: "plus")
            })
        }
    }
}


struct ButtonSectionStyle: View{
    var section: Section
    
    var body: some View{
            VStack(alignment:.leading){
                Text(section.title)
                    .bold()
                Text(section.subtitle)
                    .foregroundColor(.secondary)
            }.padding(.vertical)
    }
}
