//
//  onboarding_2.swift
//  Speech_app
//
//  Created by Claudio D'Amore on 16/11/21.
//

import SwiftUI

struct PageTwo: View {    
    var body: some View {
        
        VStack {
            PageImage(name: "music.mic", color: secondaryColor)
            titleLine
            firstTipsLine
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var titleLine: some View {
        Text("Go prepared")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
    
    @ViewBuilder
    var firstTipsLine: some View {
        Text("With SpeakUp you can organise and note down the contents of your speech, so you can feel confident and at ease in front of a microphone.")
            .font(.title2)
            .lineSpacing(2)
            .padding([.leading, .bottom, .trailing])
            .padding(.horizontal)
            .padding(.bottom)
    }
}
 

