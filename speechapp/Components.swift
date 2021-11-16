//
//  Components.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 15/11/21.
//

import SwiftUI

struct Tile: View {
    var symbol: String
    var title: String
    var color: Color
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var body: some View {
        Button(action: {
            //do
        }, label: {
            ZStack{
                Image(systemName: self.symbol)
                    .font(.system(size: self.screenWidth*scale.imageSize))
                    .padding(.bottom)
                Text(self.title)
                    .font(.system(size: (self.screenWidth*scale.imageSize)/3))
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding()
            }
            .frame(width: self.screenWidth*scale.width, height: self.screenHeight*scale.height)
        })
        .frame(width: self.screenWidth*scale.width, height: self.screenHeight*scale.height)
        .background(self.color)
        .foregroundColor(.white)
        .cornerRadius(cornerRad)
    }
    
}


struct FlashcardTile: View{
    var symbol: String
    var title: String
    var color: Color
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var description: String
    var front: Bool
    
    var body: some View{
        if front {
            VStack{
                Image(systemName: symbol)
                    .foregroundColor(.white)
                Text(title)
                    .foregroundColor(.white)
            }
            .frame(width: self.screenWidth*scale.width, height: self.screenHeight*scale.height)
            .border(color, width: 15)
            .background(.white)
            .foregroundColor(.black)
            .cornerRadius(cornerRad)
        }else{
            VStack{
                Text(title)
                    .frame(height: screenHeight/2, alignment: .bottom)
                    .foregroundColor(.white)
                    .font(.system(size: screenWidth*0.15, weight: .bold))
                
                Image(systemName: symbol)
                    .foregroundColor(.white)
                    .font(.system(size: screenWidth*0.3))
                    .frame(height: screenHeight/2, alignment: .top)
                    .padding()
                
                    
            }
            .frame(width: self.screenWidth*scale.width, height: self.screenHeight*scale.height, alignment: .center)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(cornerRad)
            .padding()
        }
    }
}

