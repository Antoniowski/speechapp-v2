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
            Spacer()
            titleLine
            HStack{
                PageImage(name: "person.2.wave.2.fill", color: primaryColor)
                VStack(alignment: .leading){
                    firstLine
                    firstTipsLine
                }
                .frame(width: UIScreen.main.bounds.width*0.6, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
            HStack{
                PageImage(name: "music.mic", color: primaryColor)
                VStack(alignment: .leading){
                    secondLine
                    secondTipsLine
                }
                .frame(width: UIScreen.main.bounds.width*0.6, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
            HStack{
                PageImage(name: "lanyardcard.fill", color: primaryColor)
                VStack(alignment: .leading){
                    thirdLine
                    thirdTipsLine
                }
                .frame(width: UIScreen.main.bounds.width*0.6, alignment: .leading)
                .padding(.horizontal)
            }
            .padding()
            Spacer()
            continueButton
        }
    }
    
    @ViewBuilder
    var titleLine: some View {
        Text("Create your first speech and start speaking!\n")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding()
            .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var firstLine: some View {
        Text("Deliver a beautiful speech")
            .font(.title3)
            .fontWeight(.bold)
    }
    
    @ViewBuilder
    var firstTipsLine: some View {
        Text("SpeakTo helps you write an organic and well structured speech, that everyone in the room will follow and understand.")
            .font(.caption)
            .fontWeight(.thin)
    }
    
    @ViewBuilder
    var secondLine: some View {
        Text("Go prepared")
            .font(.title3)
            .fontWeight(.bold)
    }
    
    @ViewBuilder
    var secondTipsLine: some View {
        Text("With SpeakTo you can organise and note down the contents of your speech, so you can feel confident and at ease in front of a microphone.")
            .font(.caption)
            .fontWeight(.thin)
    }
    
    @ViewBuilder
    var thirdLine: some View {
        Text("Make it hard to forget")
            .font(.title3)
            .fontWeight(.bold)
    }
    
    @ViewBuilder
    var thirdTipsLine: some View {
        Text("Stuck? With SpeakTo you can keep the flashcards of your speech at hand, and colors and symbols will help jog your memory.")
            .font(.caption)
            .fontWeight(.thin)
    }
    
    @ViewBuilder
    var continueButton: some View {
        Button(action: {
            dismiss()
        }) {
            Text("Continue")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
        }
        .padding()
        .padding(.bottom)
        .buttonStyle(.borderedProminent)
    }
}
    
struct PageImage: View {
    var name: String
    var color: Color
    
    var body: some View {
        Image(systemName: name)
            .font(.system(size: UIScreen.main.bounds.height*0.05))
            .frame(width: UIScreen.main.bounds.width*0.2)
            .foregroundColor(color)
            .padding(.leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewDevice("iPhone 11")
    }
}
