//
//  WheelSpinSheet.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import Foundation
import SwiftUI

struct WheelSpinSheet: View {

    @Binding var winningContract: Contract?

    var body: some View {
        VStack(alignment: .center) {
            Text("Congratulations!")
                .font(Constants.Fonts.headerProfile)
                .foregroundStyle(Constants.Colors.white)
                .padding(.top, 10)
            Text("You won a \(winningContract?.rarity.string ?? "common") contract")
                .font(Constants.Fonts.packSubtitle)
                .foregroundStyle(Constants.Colors.white)
            ViewController(UIWheelViewController())
                .padding(.top, 10)
        }
        .padding()
        .background(Constants.Colors.background)
        .ignoresSafeArea()

    }
}

#Preview {
    WheelSpinSheet(winningContract: .constant(Contract.dummyData[0]))
}
