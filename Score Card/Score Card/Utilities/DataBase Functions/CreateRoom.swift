//
//  CreateRoom.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation
import Firebase
import SwiftUI

// Create a room with a unique identifier for each player
func createRoom(roomCode: String, playerName: String, gameName: String) {
    let roomRef = Database.database().reference().child("rooms").child(roomCode)

    roomRef.updateChildValues([
        "players": [
            playerName: [
                "name": playerName,
                "score": 0,
                "tricks_wanted": 0,
                "tricks_taken": 0,
            ]
        ],
        "game": gameName
    ]) { error, ref in
        if let error = error {
            print("Error creating room: \(error.localizedDescription)")
        } else {
            print("Room created successfully!")
            // You can navigate to the room view here
        }
    }
}
