//
//  RoomDataManager.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation
import Firebase

class RoomDataManager: ObservableObject {
    @Published var currentRoom: Room?

    private var roomRef: DatabaseReference

    init(roomCode: String) {
        self.roomRef = Database.database().reference().child("rooms").child(roomCode)
        fetchRoomData()
    }

    func fetchRoomData() {
        roomRef.observe(.value) { snapshot, _ in
            guard let value = snapshot.value as? [String: Any] else {
                print("Data snapshot is not of the expected type")
                return
            }
            
            let id = snapshot.key
            let playersDict = value["players"] as? [String: [String: Any]] ?? [:]
            
            let decodedPlayers: [String: Player] = playersDict.reduce(into: [String: Player]()) { (dict, pair) in
                let (key, value) = pair
                guard let playerData = value as? [String: Any] else { return }
                
                let name = playerData["name"] as? String ?? ""
                let score = playerData["score"] as? Int ?? 0
                let tricksWanted = playerData["tricks_wanted"] as? Int ?? 0
                let tricksTaken = playerData["tricks_taken"] as? Int ?? 0
                
                dict[key] = Player(name: name, score: score, tricks_wanted: tricksWanted, tricks_taken: tricksTaken)
            }
            
            self.currentRoom = Room(id: id, players: decodedPlayers)
        }
    }

}

