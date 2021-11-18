//
//  SettingsView.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 16/11/21.
//

import SwiftUI

struct SectionView: View {
    
//    @Binding var speech: Speech
    
    var arraySupporto: [String] = ["ciao", "ciao", "ciao", "ciao"]

    var body: some View {
        GeometryReader{ screenDim in
            NavigationView {
                List{
                    ForEach(arraySupporto, id: \.self){ section in
                        Button(action: {}, label: {
                            ButtonSectionStyle(text: section)
                        })
                    }
                }
                .navigationTitle("Speech Name")
                .navigationBarItems(trailing: HStack{
                    Button(action: {
                        //do
                    }, label: {
                        ButtonNavBar(name: "", symbol: "play.fill")
                    })
                    Button(action: {
                        //do
                    }, label: {
                        ButtonNavBar(name: "ciao", symbol: "plus")
                    })
                })
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct ButtonNavBar: View{
    var name: String = ""
    var symbol: String = ""
    
    var body: some View{
        Label(name, systemImage: symbol)
            .foregroundColor(appAccentColor)
            .padding(8)
    }
}


struct ButtonSectionStyle: View{
    @State var text: String = ""
    
    var body: some View{
        HStack{
            VStack{
                Text(text)
                    .bold()
                    .foregroundStyle(.black)
                Text("section description")
                    .foregroundColor(.gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            Label("", systemImage: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct Preview3: PreviewProvider{
    static var previews: some View{
        SectionView()
    }
}
