//
//  Button.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/12/24.
//

import SwiftUI

struct RoundRectangleButton: View {
    
    var buttonText: String = ""
    var lightColor: Color = .customGold
    var darkColor: Color = .customDarkGold
    var textColor: Color = .black
    var buttonWidth: CGFloat = 250
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 250)
                    .foregroundColor(darkColor)
                    .frame(width: buttonWidth, height: 60)
                    .offset(y: 5)
                
                RoundedRectangle(cornerRadius: 250)
                    .foregroundColor(lightColor)
                    .frame(width: buttonWidth, height: 60)
            }
            
            Text("\(buttonText)")
                .fontWeight(.heavy)
                .font(.title2)
                .kerning(1)
                .foregroundColor(textColor)
                .shadow(color: .black.opacity(0.15), radius: 0.15, x: 1, y: 1)
            
        }
        
    }
}

#Preview {
    RoundRectangleButton()
}
