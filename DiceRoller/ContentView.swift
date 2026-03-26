//
//  ContentView.swift
//  DiceRoller
//
//  Created by Александра Савичева on 12.03.2026.
//

import SwiftUI

struct ContentView: View {
    @Environment(DiceManager.self) private var diceManager
    
    var body: some View {
        VStack {
            Text("Dice Roller")
                .font(.largeTitle
                    .lowercaseSmallCaps()
                    .bold())
            
            HStack {
                ForEach(diceManager.dices) { dice in
                    DiceView(dice: dice)
                }
            }
            
            HStack {
                Button("Add Dice", systemImage: "plus.app.fill") {
                    withAnimation {
                        diceManager.addDice()
                    }
                }
                .disabled(diceManager.dices.count == 5)
                
                Button("Remove Dice", systemImage: "minus.square.fill") {
                    withAnimation {
                        diceManager.removeDice()
                    }
                }
                .disabled(diceManager.dices.count == 1)
            }
            .padding()
            .labelStyle(.iconOnly)
            .font(.title)
            
            if (diceManager.dices.count > 1) {
                Button("Roll all dices") {
                    diceManager.rollAllDices()
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.appBackground)
        .tint(.white)
    }
}

#Preview {
    ContentView()
        .environment(DiceManager.shared)
}
