//
//  RoundedTextbox.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import SwiftUI

struct RoundedTextbox: View {

    var hintText: String = ""
    @State var text: String = ""
    private var textboxWidth: CGFloat = 300
    private var textboxHeight: CGFloat = 65

    var body: some View {

        ZStack {
            
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
                .frame(width: textboxWidth, height: textboxHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 3)
                )
                .offset(y: 5)
            
            TextField(hintText, text: $text)
                .padding(.horizontal, 20)
                .frame(width: textboxWidth, height: textboxHeight)
                .background(Color.customBackgroundColor)
                .cornerRadius(25)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.black, lineWidth: 3)
                )
                .fontWeight(.heavy)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)

        }
    }
}

#Preview {
    RoundedTextbox()
}
