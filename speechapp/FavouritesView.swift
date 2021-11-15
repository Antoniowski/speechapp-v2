//
//  FavoritesView.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

struct FavouritesView: View{

    private var gridLayout = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View{
        GeometryReader{
            screenDim in
            ScrollView{
                LazyVGrid(columns: gridLayout, spacing: screenDim.size.width*favoritesScale().padding){
                    ForEach(mySpeeches, id: \.self) { speech in
                        if speech.isFavorite {
                        Button(action: {
                            // do
                        }, label: {
                            ZStack{
                                Image(systemName: speech.symbol)
                                    .font(.system(size:screenDim.size.width*favoritesScale().imageSize))
                                    .padding(.bottom)
                                Text(speech.title)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                                    .padding()
                            }
                            .frame(width: screenDim.size.width*favoritesScale().width, height: screenDim.size.width*favoritesScale().width)
                        })
                        .frame(width: screenDim.size.width*favoritesScale().width, height: screenDim.size.width*favoritesScale().width)
                        .background(speech.color)
                        .foregroundColor(.white)
                        .cornerRadius(cornerRad)
                        }
                    }
                }.padding()
            }
        }
    }
}
