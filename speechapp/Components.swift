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
