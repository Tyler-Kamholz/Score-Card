//
//  AddPlayer.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation
import Firebase
import SwiftUI

func addPlayerToRoom(roomCode: String, playerName: String, completion: @escaping (Bool) -> Void) {
    
    let roomRef = Database.database().reference().child("rooms").child(roomCode)
    
    // Check if the player already exists in the room
    roomRef.child("players").observeSingleEvent(of: .value) { snapshot in
        if !snapshot.exists() {
            print("Room does not exist.")
            completion(false)  // Room doesn't exist, return false
            return
        }
        
        if let players = snapshot.value as? [String: Any] {
            // If the player already exists, don't add them again
            if players[playerName] != nil {
                print("Player already exists in the room.")
                completion(false)  // Player already exists, return false
                return
            }
            
            if players.count < 6 {
                // If the player doesn't exist, add them
                var newPlayerData = [
                    playerName: ["name": playerName,
                                 "score": 0,
                                 "tricks_wanted": 0,
                                 "tricks_taken": 0]
                ]
                
                // Get the existing player data from the room
                roomRef.child("players").observeSingleEvent(of: .value) { snapshot in
                    if let existingPlayers = snapshot.value as? [String: Any] {
                        // Add the new player data to the existing player data
                        for (key, value) in existingPlayers {
                            newPlayerData[key] = value as? [String : Any]
                        }
                    }
                    
                    // Add the new player data to the "players" node
                    roomRef.child("players").setValue(newPlayerData) { error, ref in
                        if let error = error {
                            print("Error adding player to room: \(error.localizedDescription)")
                            completion(false)  // Return false if there's an error
                        } else {
                            print("Player added to room successfully!")
                            completion(true)  // Return true if the player is added successfully
                        }
                    }
                }
            } else {
                print("Room is full.")
                completion(false)  // Room is full, return false
            }
        }
    }
}
