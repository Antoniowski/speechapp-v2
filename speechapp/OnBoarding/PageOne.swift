//
//  PageOne.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 22/11/21.
//

import SwiftUI

struct PageOne: View {    
    var body: some View {
        
        VStack {
            PageImage(name: "person.2.wave.2.fill", color: primaryColor)
            titleLine
            firstTipsLine
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var titleLine: some View {
        Text("Deliver a beautiful speech")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
    
    @ViewBuilder
    var firstTipsLine: some View {
        Text("SpeakUp helps you write an organic and well structured speech, that everyone in the room will follow and understand.")
            .font(.title2)
            .lineSpacing(2)
            .padding([.leading, .bottom, .trailing])
            .padding(.horizontal)
    }
}
