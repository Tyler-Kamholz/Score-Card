//
//  WizardView.swift
//  Score Card
//
// This is where I add 
//
//  Created by Tyler  Kamholz on 8/12/24.
//

import SwiftUI

struct WizardView: View {

    //need this to change the back button
    @Environment(\.presentationMode) private var presentationMode:
        Binding<PresentationMode>

    @State private var isSure: Bool = false
    @State private var isShowingMenuSheet: Bool = false
    @State private var isShowingExitSheet: Bool = false
    @State private var hasBetTrick: Bool = false
    @State private var numTricks: String = ""
    @State private var tricksBet: Int = 0
    @State private var tricksGot: Int = 0
    @State private var currentScore: Int = 0
    @State private var textboxWidth: CGFloat = 100
    @State private var textboxHeight: CGFloat = 100
    @State private var players: [Player] = []

    var code: String
    var name: String

    var body: some View {

        ZStack {

//Background color -----------------------------------------------
            ScreenBackgroundColor()

            VStack {

//Leader Board ---------------------------------------------------
                WizardLeaderBoard(players: players, gameCode: code)

//Trick Input ----------------------------------------------------
                
                Spacer()
                
                if hasBetTrick {
                    Text("Tricks Got")
                        .fontWeight(.heavy)
                } else {
                    Text("Tricks Wanted")
                        .fontWeight(.heavy)
                }
                
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
                    
                    TextField("", text: $numTricks)
                        .padding(.horizontal, 20)
                        .frame(width: textboxWidth, height: textboxHeight)
                        .background(Color.customBackgroundColor)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 3)
                        )
                        .fontWeight(.heavy)
                        .font(.system(size: 30))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)

                }
                .padding(.bottom, 20)
                
                HStack {
                    
//Exit Button-----------------------------------------------------
                    Button {

                        isShowingExitSheet.toggle()

                    } label: {

                        CircleButton(
                            lightColor: .customLightRed,
                            darkColor: .customMediumRed)

                    }.sheet(isPresented: $isShowingExitSheet) {

                        AreYouSureView(isSure: $isSure)
                            .presentationDragIndicator(.hidden)
                            .presentationDetents([.height(300)])

                    }
//Enter Bet Button ---------------------------------------------------
//this is where you will update the db for score for this person
//
                    if numTricks != "" {
                        
                        Button {
                            
                            //tricks got
                            if hasBetTrick {
                                
                                tricksGot = Int(numTricks)!
                                numTricks = ""
                                currentScore = calculateWizardScore(
                                    currentScore: currentScore,
                                    betTricks: tricksBet,
                                    tricksGot: tricksGot)
                                updateScore(for: name, newScore: currentScore, roomCode: code)
                                updateTrickBet(for: name, newBet: 0, roomCode: code)
                                hasBetTrick.toggle()
                                
                            //tricks bet
                            } else {
                                
                                tricksBet = Int(numTricks)!
                                numTricks = ""
                                updateTrickBet(for: name, newBet: tricksBet, roomCode: code)
                                hasBetTrick.toggle()
                                
                            }

                        } label: {

                            if hasBetTrick {
                                RoundRectangleButton(
                                    buttonText: "Submit Total",
                                    lightColor: .customLightGreen,
                                    darkColor: .customMediumGreen,
                                    buttonWidth: 200)
                            } else {
                                RoundRectangleButton(
                                    buttonText: "Submit Bet",
                                    lightColor: .customLightGreen,
                                    darkColor: .customMediumGreen,
                                    buttonWidth: 200)
                            }

                        }
                        
                    } else {
                        
                        if hasBetTrick {
                            RoundRectangleButton(
                                buttonText: "Submit Total",
                                lightColor: .customLightGray,
                                darkColor: .customMediumGray,
                                textColor: .customMediumGray,
                                buttonWidth: 200)
                        } else {
                            RoundRectangleButton(
                                buttonText: "Submit Bet",
                                lightColor: .customLightGray,
                                darkColor: .customMediumGray,
                                textColor: .customMediumGray,
                                buttonWidth: 200)
                        }
                        
                    }

//Code button---------------------------------------------------------
                    Button {

                        isShowingMenuSheet.toggle()

                    } label: {

                        CircleButton(
                            lightColor: .customGold,
                            darkColor: .customDarkGold,
                            iosImage: "line.3.horizontal")

                    }
                    .sheet(isPresented: $isShowingMenuSheet) {

                        CodeView(code: "\(code)")
                            .presentationDragIndicator(.visible)
                            .presentationDetents([.height(180)])

                    }
                }

            }

        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: isSure) {
            if isSure {
                presentationMode.wrappedValue.dismiss()
                deletePlayerFromRoom(roomCode: code, name: name)
            }
        }

    }
}

#Preview {
    WizardView(code: "000000", name: "")
}
