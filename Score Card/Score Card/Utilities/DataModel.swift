//
//  DataModel.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation

struct Room: Identifiable, Codable {
    let id: String
    var players: [String: Player]

    enum CodingKeys: String, CodingKey {
        case id
        case players
    }
}
