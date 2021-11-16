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
    @State var front: Bool
    
//    LONG PRESS GESTURE
    @GestureState var isDetectingLongPress = false
    var longPress: some Gesture{
        LongPressGesture(minimumDuration: 0.75)
            .updating($isDetectingLongPress){
                currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded{ _ in
                front = true
            }
    }
    
    var body: some View{
        if front {
            VStack{
                Image(systemName: symbol)
                    .foregroundColor(.black)
                    .font(.system(size: 40))
                    .frame(height: screenHeight/8, alignment: .bottom)
                Text(title)
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .bold))
                Text(description)
                    .foregroundColor(.black)
                    .padding()
            }
            .frame(width: self.screenWidth*scale.width, height: self.screenHeight*scale.height, alignment: .top)
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
            .gesture(longPress)
        }
    }
}

