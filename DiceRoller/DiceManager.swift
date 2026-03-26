//
//  DiceManager.swift
//  DiceRoller
//
//  Created by Александра Савичева on 26.03.2026.
//

import SwiftUI

@Observable
class Dice: Identifiable {
    public private(set) var numberOfPips = Int.random(in: 1...6)
    
    func rollTheDice() {
        numberOfPips = Int.random(in: 1...6)
    }
}

@Observable
class DiceManager {
    static var shared = DiceManager()
    var dices: [Dice]
    
    private init() {
        dices = [Dice()]
    }
    
    func addDice() {
        dices.append(Dice())
    }
    
    func removeDice() {
        dices.popLast()
    }
    
    func rollAllDices() {
        for dice in dices {
            dice.rollTheDice()
        }
    }
}
