//
//  UpdateScore.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/15/24.
//

import Foundation
import Firebase

func updateScore(for playerName: String, newScore: Int, roomCode: String) {
    let roomRef = Database.database().reference().child("rooms").child(roomCode)
    let playerRef = roomRef.child("players").child(playerName)

    playerRef.updateChildValues(["score": newScore]) { error, ref in
        if let error = error {
            print("Error updating score: \(error.localizedDescription)")
        } else {
            print("Score updated successfully!")
        }
    }
}
