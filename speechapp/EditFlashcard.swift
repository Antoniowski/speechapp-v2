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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View{
        GeometryReader{ screenDim in
            VStack{
                Section{
                    TextField("Title", text: $title)
                        .font(.system(.title))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: screenDim.size.height/10)
                        .padding(.leading)
                }
                Section{
                    TextEditor(text: $description)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .padding()
                }
            }
            .navigationBarItems(trailing:navigationBarTrailingItems)
            .padding()
        }
    }
}


private extension EditFlashcard {
    
    @ViewBuilder
    var navigationBarTrailingItems: some View {
        HStack{
            Button(action: {
                dismiss()
            }, label: {
                Text("Save")
            })
        }
        .padding()
    }
}
