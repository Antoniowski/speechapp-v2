//
//  OnboardingComponents.swift
//  speechapp
//
//  Created by Anthea Lavinia Bove on 22/11/21.
//

// 
// Remember your objectives:\nMaking a good impression and leaving your audience with two or three takeaways.\nThe rest is just entertainment. 

import SwiftUI

struct PageImage: View {
    var name: String
    var color: Color
    
    var body: some View {
        Image(systemName: name)
            .font(.system(size: UIScreen.main.bounds.height*0.2))
            .foregroundColor(color)
    }
}

struct ContinueButton: View {
    @Binding var increment: Int
    
    var body: some View {
        Button(action: {
            increment += 1
        }) {
            Image(systemName: "chevron.right")
                .font(.largeTitle)
                .padding()
            
        }
        .padding()
        .padding(.bottom)
        .buttonStyle(.bordered)
    }
}
