//
//  PageThree.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 22/11/21.
//

import SwiftUI

struct PageThree: View {    
    var body: some View {
        
        VStack {
            PageImage(name: "lanyardcard.fill", color: tertiaryColor)
            titleLine
            firstTipsLine
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var titleLine: some View {
        Text("Make it hard to forget")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
    
    @ViewBuilder
    var firstTipsLine: some View {
        Text("Stuck? With SpeakUp you can keep the flashcards of your speech at hand, and colors and symbols will help jog your memory.")
            .font(.title2)
            .lineSpacing(2)
            .padding([.leading, .bottom, .trailing])
            .padding(.horizontal)
            .padding(.bottom)
    }
}
