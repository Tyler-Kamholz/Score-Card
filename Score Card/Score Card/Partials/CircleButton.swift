//
//  CircleButton.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/12/24.
//

import SwiftUI

struct CircleButton: View {
    
    var lightColor: Color = .customGold
    var darkColor: Color = .customDarkGold
    var iosImage: String = "arrow.backward"
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 250)
                    .foregroundColor(darkColor)
                    .frame(width: 60, height: 60)
                    .offset(y: 5)
                
                RoundedRectangle(cornerRadius: 250)
                    .foregroundColor(lightColor)
                    .frame(width: 60, height: 60)
            }
            
            Image(systemName: iosImage)
                .fontWeight(.heavy)
                .font(.title2)
                .kerning(1)
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.15), radius: 0.15, x: 1, y: 1)
            
        }
        
    }
    
}

#Preview {
    CircleButton()
}
