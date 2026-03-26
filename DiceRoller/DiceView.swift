//
//  DiceView.swift
//  DiceRoller
//
//  Created by Александра Савичева on 12.03.2026.
//

import SwiftUI

struct DiceView: View {
    var dice: Dice
    
    var body: some View {
        VStack {
            Image(systemName: "die.face.\(dice.numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode: .fit)
                .foregroundStyle(.black, .white)
                .onTapGesture {
                    withAnimation {
                        dice.rollTheDice()
                    }
                }
            
            Button("Roll") {
                withAnimation {
                    dice.rollTheDice()
                }
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
        }
    }
}

#Preview {
    let dice = Dice()
    DiceView(dice: dice)
        .environment(DiceManager.shared)
}
