//
//  GetGameName.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/15/24.
//

import Foundation
import Firebase

func getGameRoomName(roomCode: String, completion: @escaping (String?) -> Void) {
    let roomRef = Database.database().reference().child("rooms").child(roomCode)

    roomRef.observeSingleEvent(of: .value) { snapshot in
        if let roomData = snapshot.value as? [String: Any],
           let name = roomData["name"] as? String { // name is now optional
            completion(name) // Return the room name
        } else {
            completion(nil) // Return nil if the room name is not found
        }
    }
}
