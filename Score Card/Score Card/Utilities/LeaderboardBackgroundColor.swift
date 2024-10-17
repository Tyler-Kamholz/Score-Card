//
//  LeaderboardBackgroundColor.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation
import SwiftUI

func getBackgroundColor(for index: Int) -> Color {

    switch index {
    case 0:
        return .yellow
    case 1:
        return Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
    case 2:
        return Color.orange
    default:
        return .white
    }

}
