//
//  ScoreBoardViewSelector.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/14/24.
//

import Foundation
import SwiftUI

//this is for getting the right view
func destinationView(for item: String, gameCode: String, name: String) -> AnyView {
    switch item {
    case "Wizard":
        AnyView(WizardView(code: gameCode, name: name))
    case "Farkle":
        AnyView(FarkleView())
    case "Quixx":
        AnyView(QuixxView())
    case "Yahtzee":
        AnyView(YahtzeeView())
    default:
        AnyView(Text("No Game Selected"))
    }
}
