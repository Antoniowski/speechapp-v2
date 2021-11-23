//
//  ContentView.swift
//  Speech_app
//
//  Created by Claudio D'Amore on 13/11/21.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedTab: Int = 0
    
    var body: some View {
        VStack{
        TabView(selection: $selectedTab) {
            PageOne().tag(0)
            PageTwo().tag(1)
            PageThree().tag(2)
            FirstSpeech().tag(3)
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .never))
            if selectedTab < 3 {
                ContinueButton(increment: $selectedTab)
            } else {
                lastButton
            }
        }
    }
    
    @ViewBuilder
    var lastButton: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Create your first speech")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
        }
        .padding()
        .padding(.bottom)
        .buttonStyle(.borderedProminent)
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewDevice("iPhone 11")
            .accentColor(appAccentColor)
    }
}
