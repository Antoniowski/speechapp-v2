//
//  ContentView.swift
//  Speech_app
//
//  Created by Claudio D'Amore on 13/11/21.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showNext = false
    
    var body: some View {
    
  VStack {
            Image(systemName:"music.mic")
                .padding(.top)
                .padding()
                .font(.system(size: UIScreen.main.bounds.height*0.20))
                .foregroundColor(primaryColor)
            Text("Creating a beautiful speech")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("In writing a speech, you have two objectives:\nMaking a good impression and leaving your audience with two or three takeaways.\nThe rest is just entertainment. ")
                .lineSpacing(5)
                .padding([.leading, .bottom, .trailing])
            Button(action: {
                showNext.toggle()
            }) {
                Text("Continue")
                    .padding()
                    .frame(width: UIScreen.main.bounds.width*0.5)
                   }
            .padding()
            .buttonStyle(.borderedProminent)
           .sheet(isPresented: $showNext){
               onboarding_2()
                   .accentColor(appAccentColor)
           }
            }
            .multilineTextAlignment(.center)
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
