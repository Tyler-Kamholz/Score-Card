//
//  Player.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import Foundation
import SwiftUI

struct Player: Codable {
    let name: String
    var score: Int
    var tricks_wanted: Int
    var tricks_taken: Int
}
