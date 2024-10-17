//
//  DeletePlayer.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation
import SwiftUI
import Firebase

func deletePlayerFromRoom(roomCode: String, name: String) {
    let roomRef = Database.database().reference().child("rooms").child(roomCode)

    // Remove the player from the "players" node
    roomRef.child("players").child(name).removeValue { error, ref in
        if let error = error {
            print("Error deleting player from room: \(error.localizedDescription)")
        } else {
            print("Player deleted from room successfully!")

            // Check if the room is empty after deleting the player
            roomRef.child("players").observeSingleEvent(of: .value) { snapshot in
                if !snapshot.exists() {
                    // Room is empty, delete the room
                    roomRef.removeValue { error, ref in
                        if let error = error {
                            print("Error deleting room: \(error.localizedDescription)")
                        } else {
                            print("Room deleted successfully!")
                        }
                    }
                }
            }
        }
    }
}

