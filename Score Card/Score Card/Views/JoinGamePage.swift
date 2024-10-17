//
//  JoinGamePage.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/12/24.
//
import SwiftUI

struct JoinGamePage: View {
    
    @Environment(\.presentationMode) private var presentationMode:
    Binding<PresentationMode>
    
    @State var name: String = ""
    @State var gameCode: String = ""
    @State private var navigateToGameRoom: Bool = false
    @State private var isShowingMenuSheet: Bool = false
    @State private var isShowingExitSheet: Bool = false
    @State private var isSure: Bool = false
    
    private var textboxWidth: CGFloat = 325
    private var textboxHeight: CGFloat = 65
    
    func roomGameName() -> String {
        
        var gameName: String = ""
        
        getGameRoomName(roomCode: gameCode) { roomName in
            if let name = roomName {
                gameName = name
            } else {
                print("Room name not found.")
            }
        }
        return gameName
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                ScreenBackgroundColor()
                
                VStack {
                    
                    Spacer()
//Text box for name --------------------------------------------------------------------------------
                    Text("Name")
                    
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
                    
//Text box for name --------------------------------------------------------------------------------
                    Text("Game Code")
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.black)
                            .frame(width: textboxWidth, height: textboxHeight)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            .offset(y: 5)
                        
                        TextField("", text: $gameCode)
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
                    
                    Spacer()
                    
                    HStack {
                        
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
                        
                        RoundRectangleButton(
                            buttonText: "JOIN GAME",
                            lightColor: .customLightGreen,
                            darkColor: .customMediumGreen
                        )
                        .onTapGesture {
                            addPlayerToRoom(roomCode: gameCode, playerName: name) { success in
                                if success {
                                    navigateToGameRoom = true
                                    isShowingMenuSheet = false
                                } else {
                                    isShowingMenuSheet = true
                                    navigateToGameRoom = false
                                }
                            }
                        }
                    }
                    .padding()
                    .navigationBarBackButtonHidden(true)
                }
                
            }
            .sheet(isPresented: $isShowingMenuSheet) {
                CodeErrorView(code: "\(gameCode)")
                    .presentationDragIndicator(.visible)
                    .presentationDetents([.height(180)])
            }
            // Use .navigationDestination to navigate when the condition is met
            .navigationDestination(isPresented: $navigateToGameRoom) {
                WizardView(code: gameCode, name: name)
                
                
            }
        }
        
    }
    
}
#Preview {
    JoinGamePage()
}
