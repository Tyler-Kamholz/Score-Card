//
//  AreYouSureView.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import SwiftUI

struct AreYouSureView: View {
    
    @Environment(\.presentationMode) private var presentationMode:
        Binding<PresentationMode>
    
    @Binding var isSure: Bool
    
    var body: some View {
        
        ZStack {
            
            ScreenBackgroundColor()
            
            VStack {
                
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color.black)
                        .frame(width: 300, height: 75)
                        .offset(y: 2)

                    RoundedRectangle(cornerRadius: 25)
                        .foregroundStyle(Color.customGold)
                        .frame(width: 300, height: 75)
                    
                    VStack{
                        
                        Text("Are You Sure?")
                            .font(.system(size: 30, weight: .heavy))
                        
                    }
                    
                }
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    isSure = false
                    
                } label: {
                    
                    RoundRectangleButton(buttonText: "Wait! NO!",
                                         lightColor: .customLightGreen,
                                         darkColor: .customMediumGreen)
                    
                }
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    isSure = true
                    
                } label: {
                    
                    RoundRectangleButton(buttonText: "Yes :(",
                                         lightColor: .customLightRed,
                                         darkColor: .customDarkRed)
                    
                }
                
            }
            
        }
        
    }
}

#Preview {
    AreYouSureView(isSure: .constant(false))
}
