//
//  CodeView.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import SwiftUI

struct CodeView: View {
    
    var code: String = "000000"
    
    var body: some View {
        
        ZStack {
            
            ScreenBackgroundColor()
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color.customDarkGold)
                    .frame(width: 300, height: 150)
                    .offset(y: 8)

                RoundedRectangle(cornerRadius: 25)
                    .foregroundStyle(Color.customGold)
                    .frame(width: 300, height: 150)
                
                VStack{
                    
                    Text("Game Code")
                        .font(.system(size: 30, weight: .medium))
                    
                    Text(code)
                        .font(.system(size: 40, weight: .black))
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    CodeView()
}
