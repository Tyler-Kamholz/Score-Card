//
//  ScreenBackgroundColor.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/12/24.
//

import SwiftUI

struct ScreenBackgroundColor: View {
    
    var body: some View {
        
        Rectangle()
            .foregroundColor(.colorBackground)
            .ignoresSafeArea(.all)
        
    }
}

#Preview {
    ScreenBackgroundColor()
}
