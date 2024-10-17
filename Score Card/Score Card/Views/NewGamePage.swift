//
//  MainPage.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/12/24.
//

import Firebase
import SwiftUI

struct NewGamePage: View {

    //need this to change the back button
    @Environment(\.presentationMode) private var presentationMode:
        Binding<PresentationMode>

    //Need to make this game code in the db so people can join games
    @State var gameCode: String = String(Int.random(in: 100000...999999))
    @State var name: String = ""
    //this is the selected item
    @State private var selectedItem: String? = nil

    //list of games
    let items = ["Wizard", "Farkle", "Quixx", "Yahtzee"]

    private var textboxWidth: CGFloat = 325
    private var textboxHeight: CGFloat = 65

    var body: some View {

        NavigationStack {

            ZStack {

                //background color---------------------------------------------------
                ScreenBackgroundColor()

                VStack {

                    //the game list-------------------------------------------------------
                    VStack {
                        ForEach(items, id: \.self) { item in
                            let isSelected = selectedItem == item
                            let lightColor =
                                isSelected
                                ? Color.customLightGreen : Color.customLightGray
                            let darkColor =
                                isSelected
                                ? Color.customMediumGreen
                                : Color.customMediumGray
                            let textColor =
                                isSelected
                                ? .black
                                : Color.customMediumGray

                            RoundRectangleButton(
                                buttonText: "\(item)",
                                lightColor: lightColor,
                                darkColor: darkColor,
                                textColor: textColor,
                                buttonWidth: 325
                            )
                            .onTapGesture {
                                selectedItem = item
                            }
                        }
                    }

                    Spacer()

                    //textbox for name------------------------------------------------------
                    Text("Enter Name")
                        .fontWeight(.heavy)

                    //this is the textbox
                    ZStack {

                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black)
                            .frame(width: textboxWidth, height: textboxHeight)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .offset(y: 5)

                        TextField("", text: $name)
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

                    }
                    .padding(.bottom, 20)

                    //button row------------------------------------------------------------
                    HStack {

                        Button {

                            presentationMode.wrappedValue.dismiss()

                        } label: {

                            CircleButton()

                        }

                        if selectedItem != nil, name != "" {

                            NavigationLink(
                                destination: destinationView(
                                    for: selectedItem ?? "", gameCode: gameCode, name: name)
                                
                            ) {

                                RoundRectangleButton(
                                    buttonText: "Start Game",
                                    lightColor: .customLightGreen,
                                    darkColor: .customMediumGreen)

                            }.simultaneousGesture(TapGesture().onEnded {
                                print("Button Pressed")
                                createRoom(roomCode: gameCode, playerName: name, gameName: selectedItem!)
                            })

                        } else {

                            RoundRectangleButton(
                                buttonText: "Start Game",
                                lightColor: .customLightGray,
                                darkColor: .customMediumGray,
                                textColor: .customMediumGray)

                        }

                    }

                }
                .padding()

            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewGamePage()
}
