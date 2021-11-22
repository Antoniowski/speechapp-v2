//
//  FirstSpeech.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 22/11/21.
//

import SwiftUI

struct FirstSpeech: View {
//    @Binding var pag: Int
    
    var body: some View {
        
        VStack {
            PageImage(name: "bubble.left.and.bubble.right", color: secondaryColor)
            titleLine
        }
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    var titleLine: some View {
        Text("Create your first speech and start _speaking up!_")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding()
    }
}

struct FirstSpeech_Previews: PreviewProvider {
    static var previews: some View {
        FirstSpeech()
    }
}
