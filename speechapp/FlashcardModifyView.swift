//
//  FlashcardModifyView.swift
//  speechapp
//
//  Created by Antonio Romano on 21/11/21.
//

import SwiftUI

struct EditFlashcard: View{
    @State var title: String = ""
    @State var description: String = ""
    var symbol: String = ""
    var color: Color
    @Binding var isShowing: Bool
    
    var body: some View{
        NavigationView{
            GeometryReader{ screenDim in
                VStack{
                    TextField("Title", text: $title)
                        .font(.system(.title))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: screenDim.size.height/10)
                        .padding(.leading)
                    Spacer()
                    TextEditor(text: $description)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .padding()
                    
                }
                .navigationBarItems(trailing:navigationBarTrailingItems)
                .padding()
            }
            
        }
        
    }
}


private extension EditFlashcard {
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack{
            Button(action: {
                self.isShowing.toggle()
            }, label: {
                Text("Save")
            })
        }
        .padding()
    }
}
