//
//  onboarding_2.swift
//  Speech_app
//
//  Created by Claudio D'Amore on 16/11/21.
//

import SwiftUI

struct onboarding_2: View {
    var body: some View {
        
        VStack {
            Image(systemName:"paintbrush.fill")
                .padding(.top, 180.0)
                .padding(.bottom, 20)
                .font(.system(size: 150.0))
            .foregroundColor(.orange)
            
           
        HStack {
            
            TextField("Insert Intro name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .font(Font.system(size: 35, weight: .bold))
                .padding(.bottom, 200)
                .padding(.horizontal, 33.0)
          
                .textFieldStyle(.roundedBorder)
            
            VStack {
                
           
                    }
                }
                
            }
              
            
           
                
            
                
            
    
            }
                
            
        }
 


struct onboarding_2_Previews: PreviewProvider {
    static var previews: some View {
        onboarding_2()
    }
}
