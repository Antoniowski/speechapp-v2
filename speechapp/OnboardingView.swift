//
//  ContentView.swift
//  Speech_app
//
//  Created by Claudio D'Amore on 13/11/21.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
    
  VStack {
            Image(systemName:"music.mic")
                .padding(.top, 180.0)
                .padding(.bottom, 20)
                .font(.system(size: 150.0))
                .foregroundColor(.black)
            Text("Creating a beautiful speech")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("Creating a beautiful speech")
                .fontWeight(.thin)
                .padding(.bottom, 200.0)
           Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Continue")
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    
                   }
            }
    }
 
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//            .previewDevice("iPhone 11")
//            .preferredColorScheme(.light)
//        }
//    }
//}
