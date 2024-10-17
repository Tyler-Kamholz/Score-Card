//
//  UpdateTrick.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/15/24.
//

import Firebase
import Foundation

func updateTrickBet(for playerName: String, newBet: Int, roomCode: String) {
    let roomRef = Database.database().reference().child("rooms").child(roomCode)
    let playerRef = roomRef.child("players").child(playerName)

    playerRef.updateChildValues(["tricks_wanted": newBet]) { error, ref in
        if let error = error {
            print("Error updating trick bet: \(error.localizedDescription)")
        } else {
            print("Trick bet updated successfully!")
        }
    }
}
