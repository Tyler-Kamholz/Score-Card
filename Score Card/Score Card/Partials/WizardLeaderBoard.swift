//
//  WizardLeaderBoard.swift
//  Score Card
//
// This is where the dynamic data will be from the DB
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import SwiftUI

struct WizardLeaderBoard: View {

    // Sample data: list of players with their scores
    var players: [Player]
    var gameCode: String

    @ObservedObject var roomDataManager: RoomDataManager

    init(players: [Player], gameCode: String) {
        self.players = players
        self.gameCode = gameCode
        self.roomDataManager = RoomDataManager(roomCode: gameCode)
    }

    var body: some View {

        VStack {

            HStack {

                Text("Leaderboard")
                    .fontWeight(.bold)
                Spacer()
                Text("Tricks")
                    .fontWeight(.bold)
                    .frame(width: 55, height: 30)

            }

            if let room = roomDataManager.currentRoom {
                
                ForEach(
                    Array(
                        room.players.values.sorted(by: { $0.score > $1.score }).enumerated()
                    ),
                    id: \.element.name
                ) { index, player in

                    let frameWidth: CGFloat = CGFloat(300 - (index * 20))

                    HStack {

                        ZStack {

                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: frameWidth, height: 50)
                                .offset(y: 5)

                            HStack {
                                Text("\(index + 1)")
                                    .fontWeight(.heavy)

                                //player name
                                Text("\(player.name)")
                                Spacer()

                                //score
                                Text("\(player.score)")
                            }
                            .padding()
                            .background(getBackgroundColor(for: index))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .frame(width: frameWidth, height: 50)

                        }
                        Spacer()
                        ZStack {

                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 55, height: 50)
                                .offset(y: 5)

                            Text("\(player.tricks_wanted)")
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.white)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .fontWeight(.heavy)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2))

                        }

                    }
                }
            } else {
                Spacer()
                Text("Loading Room...")
                Spacer()
            }

        }
        .padding()

        Spacer()

    }
}

#Preview {
    WizardLeaderBoard(
        players: [
            Player(name: "", score: 0, tricks_wanted: 0, tricks_taken: 0)
        ], gameCode: "000000")
}
