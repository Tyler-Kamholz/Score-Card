//
//  ContentView.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/12/24.
//

import SwiftUI

struct StartPage: View {
    var body: some View {

        NavigationStack() {

            ZStack {

                ScreenBackgroundColor()

                VStack {

                    Spacer()

                    NavigationLink(destination: JoinGamePage()) {

                        RoundRectangleButton(
                            buttonText: "JOIN GAME",
                            lightColor: .customLightGreen,
                            darkColor: .customMediumGreen,
                            buttonWidth: 325)

                    }

                    //this is to go to new page
                    NavigationLink(destination: NewGamePage()) {

                        RoundRectangleButton(
                            buttonText: "NEW GAME",
                            buttonWidth: 325)

                    }

                }
                .padding()
            }
        }
    }
}

#Preview {
    StartPage()
}
