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
                .font(.system(size: 36, weight: .bold))
                .foregroundStyle(.black)
            Text("You won a \(winningContract?.rarity.rawValue ?? "common") contract")
            WheelViewController()
        }
        .padding()
    }
}

#Preview {
    WheelSpinSheet(winningContract: .constant(Contract.dummyData[0]))
}
