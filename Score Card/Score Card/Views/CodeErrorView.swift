//
//  CodeView.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import SwiftUI

struct CodeErrorView: View {
    
    var code: String = "000000"
    
    var body: some View {
        
        ZStack {
            
            ScreenBackgroundColor()
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color.customDarkRed)
                    .frame(width: 300, height: 150)
                    .offset(y: 8)

                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color.customLightRed)
                    .frame(width: 300, height: 150)
                
                VStack{
                    
                    Text("Could Not Enter Room")
                        .font(.system(size: 25, weight: .medium))
                    
                    Text(code)
                        .font(.system(size: 40, weight: .black))
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    CodeErrorView()
}
