//
//  Components.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 15/11/21.
//

//protocols x tiles o per data structure? hereditary properies?
//tile favourite/tile recent/tile flashcard
//reduce use of geometryreader
//context menu

//TODO: RESOLVE LONGPRESS PROBLEM IN FLASHCARD TILE

import SwiftUI

struct Tile: View {
    var speech: Speech
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var body: some View {
        NavigationLink(destination: {
            SectionView(speech: speech)
        }, label: {
            ZStack{
                Image(systemName: speech.symbol)
                    .font(.system(size: screenWidth*scale.imageSize))
                    .padding(.bottom)
                Text(speech.title)
                    .font(.system(size: (screenWidth*scale.imageSize)/3))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding()
                if speech.isFavorite {
                    Image(systemName: "star.fill")
                    .font(.system(size: (screenWidth*scale.imageSize)/3))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(8)
                }
            }
            .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        })
        .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        .background(speech.isFavorite ? tertiaryColor : secondaryColor)
        .foregroundColor(.white)
        .cornerRadius(cornerRad)
    }
    
}

struct MostRecentTile: View {
    var speech: Speech
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var body: some View {
        NavigationLink(destination: {
            SectionView(speech: speech)
        }, label: {
            ZStack{
                Image(systemName: speech.symbol)
                    .font(.system(size: screenWidth*scale.imageSize))
                    .padding(.bottom)
                Text(speech.title)
                    .font(.system(size: (screenWidth*scale.imageSize)/3))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    .padding()
            }
            .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        })
        .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        .background(primaryColor)
        .foregroundColor(.white)
    }
    
}

struct MostRecentTile2: View{
    var speech: Speech
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var body: some View{
        TabView{
            Button(action: {
                //do
            }, label: {
                ZStack{
                    Image(systemName: speech.symbol)
                        .font(.system(size: screenWidth*scale.imageSize))
                        .padding(.bottom)
                    Text(speech.title)
                        .font(.system(size: (screenWidth*scale.imageSize)/3))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                        .padding()
                }
                .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
            })
            .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
            .background(primaryColor)
            .foregroundColor(.white)
            
            Button(action: {
                //do
            }, label: {
                ZStack{
                    Image(systemName: speech.symbol)
                        .font(.system(size: screenWidth*scale.imageSize))
                        .padding(.bottom)
                    Text(speech.title)
                        .font(.system(size: (screenWidth*scale.imageSize)/3))
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                        .padding()
                }
                .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
            })
            .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
            .background(primaryColor)
            .foregroundColor(.white)
            
        }
        .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        .background(primaryColor)
        .foregroundColor(.white)
        .tabViewStyle(.page)
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
//    gesture seems to work but it has some problems:
//    - cant swipe on card when long press "is waiting"
//    - long press on a different card from the first one doesnt work propely
    @GestureState var isDetectingLongPress = false
    var longPress: some Gesture{
        LongPressGesture(minimumDuration: 0.75)
            .updating($isDetectingLongPress){newValue,gestureState,transaction  in
//                code
                gestureState = newValue
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
            .shadow(color: Color(white: 0, opacity: 0.3), radius: 15, x: 0, y: 0)
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
            .border(color, width: 30)
            .foregroundColor(.white)
            .cornerRadius(cornerRad)
            .padding()
            .shadow(color: Color(white: 0, opacity: 0.3), radius: 15, x: 0, y: 0)
            .onTapGesture{}
            .gesture(longPress, including: .all)
        }
    }
}

