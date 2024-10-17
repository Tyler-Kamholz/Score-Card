//
//  WizardCalculation.swift
//  Score Card
//
//  Created by Tyler  Kamholz on 8/13/24.
//

import Foundation
import SwiftUI

func calculateWizardScore(currentScore: Int, betTricks: Int, tricksGot: Int) -> Int {
    
    var totalScore: Int = currentScore
    
    let difference: Int = abs(betTricks - tricksGot)
    
    if difference == 0 {
        
        totalScore += (betTricks * 10) + 20
        
    }
    else {
        
        totalScore -= (difference * 10)
        
    }
    
    return totalScore
    
}
