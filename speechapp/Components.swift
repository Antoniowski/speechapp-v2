//
//  Components.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 15/11/21.
//

//tile favourite/tile recent/tile flashcard
//reduce use of geometryreader

import SwiftUI

struct Tile: View {
    var speech: Speech
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var body: some View {
        NavigationLink(destination: {
            PartsView(speech: speech)
        }, label: {
            speechTile
        })
        .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        .background(speech.isFavorite ? tertiaryColor : secondaryColor)
        .foregroundColor(.white)
        .cornerRadius(cornerRad)
        .contextMenu{menuOptions}
    }
    
    @ViewBuilder
    var speechTile: some View {
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
    }
    
    @ViewBuilder
    var menuOptions: some View {
        Button(action: {
            //do
        },     label: {
            Label("Favorites", systemImage: "star")
        })
        Button(action: {
           //do
        },     label: {
            Label("Copy", systemImage: "doc.on.doc")
        })
        Button(role: .destructive,
               action: {
            //do
        },     label: {
            Label("Delete", systemImage: "trash")
        })
    }
    
}

struct MostRecentTile: View {
    var speech: Speech
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    var body: some View {
        NavigationLink(destination: {
            PartsView(speech: speech)
        }, label: {
            speechTile
        })
        .frame(width: screenWidth*scale.width, height: screenHeight*scale.height)
        .background(primaryColor)
        .foregroundColor(.white)
        .contextMenu{menuOptions}
    }
    
    @ViewBuilder
    var speechTile: some View{
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
    }
    
    @ViewBuilder
    var menuOptions: some View {
        Button(action: {
            //do
        },     label: {
            Label("Favorites", systemImage: "star")
        })
        Button(action: {
           //do
        },     label: {
            Label("Copy", systemImage: "doc.on.doc")
        })
        Button(role: .destructive,
               action: {
            //do
        },     label: {
            Label("Delete", systemImage: "trash")
        })
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

struct FlashcardTileTry: View{
    var card: Flashcard
    var scale: Scale
    
    @State var front: Bool = true
    @GestureState var isDetectingLongPress = false
    var longPress: some Gesture{
        LongPressGesture(minimumDuration: 0.75)
            .updating($isDetectingLongPress){currentState,gestureState,transaction  in
                gestureState = currentState
            }
            .onEnded{ _ in
                front.toggle()
            }
    }
    
    var body: some View{
        if front {
            frontOfCard
                .onTapGesture{}
                .gesture(longPress, including: .all)
        }else{
            backOfCard
                .onTapGesture{}
                .gesture(longPress, including: .all)
        }
    }
    
    @ViewBuilder
    var frontOfCard: some View {
        VStack{
            Text(card.title)
                .font(.system(size: UIScreen.main.bounds.height*0.05, weight: .bold))
                .multilineTextAlignment(.center)
                .padding()
            Image(systemName: card.symbol)
                .font(.system(size: UIScreen.main.bounds.height*0.07, weight: .bold))
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width*scale.width, height: UIScreen.main.bounds.height*scale.height)
        .background(card.color)
        .border(card.color, width: 30)
        .cornerRadius(cornerRad)
        .padding()
        .shadow(color: Color(white: 0, opacity: 0.3), radius: 15, x: 0, y: 0)
    }
    
    @ViewBuilder
    var backOfCard: some View {
        VStack{
            Image(systemName: card.symbol)
                .font(.system(size: UIScreen.main.bounds.height*0.05, weight: .bold))
            Text(card.title)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text(card.description)
                .padding(.horizontal)
                .padding(.horizontal)
                .padding(.horizontal)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.black)
        .frame(width: UIScreen.main.bounds.width*scale.width, height: UIScreen.main.bounds.height*scale.height)
        .background(.white)
        .border(card.color, width: 15)
        .cornerRadius(cornerRad)
        .padding()
        .shadow(color: Color(white: 0, opacity: 0.3), radius: 15, x: 0, y: 0)
    }
}

struct FlashcardPreviewTile: View {
    @State private var showingSheet = false
    
    var card: Flashcard
    var screenWidth: Double
    var screenHeight: Double
    var scale: Scale
    
    
    var body: some View {
        Button(action: {
            showingSheet.toggle()
        }, label: {
            flashcardPreview
        })
            .frame(width: screenWidth*scale.width, height: screenHeight*scale.height, alignment: .center)
            .background(card.color)
            .foregroundColor(.white)
            .cornerRadius(cornerRad)
            .contextMenu{menuOptions}
            .sheet(isPresented: $showingSheet) {
                NavigationView{
                EditFlashcard(title: card.title, description: card.description, symbol: card.symbol, color: card.color)
                    .accentColor(appAccentColor)
                    .navigationTitle("Edit")
                }
            }
        
    }
    
    @ViewBuilder
    var flashcardPreview: some View {
        VStack{
            Image(systemName: card.symbol)
                .foregroundColor(.white)
                .font(.system(size: screenWidth*0.1))
                .frame(height: screenHeight/3, alignment: .bottom)
                .padding()
            
            Text(card.title)
                .frame(height: screenHeight/3, alignment: .top)
                .foregroundColor(.white)
                .font(.system(size: screenWidth*0.04, weight: .bold))
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    @ViewBuilder
    var menuOptions: some View {
        Button(action: {
            //do
        },     label: {
            Label("Create Copy", systemImage: "doc.on.doc")
        })
        Button(role: .destructive,
               action: {
            //do
        },     label: {
            Label("Delete", systemImage: "trash")
        })
    }
}

// UNUSED COMPONENTS


struct InfoBox: View{
    var text: Text = Text("")
    var body: some View{
        HStack{
            text
                .frame(minWidth: 0, maxWidth: .infinity)
            Image(systemName: "info.circle")
                .font(.system(size: 25))
                .foregroundColor(appAccentColor)
                .frame(alignment: .top)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .top)
        .background(.quaternary)
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
