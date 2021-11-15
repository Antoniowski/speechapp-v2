//
//  FavoritesView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FavoritesView: View{
    
    private var gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    var color: Color = primaryAppColor
    
    var body: some View{
        GeometryReader{
            screenDim in
            ScrollView{
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*favoritesScale().padding){
                    ForEach((0...10), id: \.self){_ in
                        Button(action: {
                            print("hello")
                        }, label: {
                            ZStack{
                                Image(systemName: "plus")
                                    .font(.system(size:screenDim.size.width*favoritesScale().imageSize))
                                    .padding(.bottom)
                                Text("Speech")
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                                    .padding()
                            }
                            .frame(width: screenDim.size.width*favoritesScale().width, height: screenDim.size.width*favoritesScale().width)
                        })
                        .frame(width: screenDim.size.width*favoritesScale().width, height: screenDim.size.width*favoritesScale().width)
                        .background(color)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRad)
                        
                        
                    }
                }.padding()
            }
        }
    }
}
