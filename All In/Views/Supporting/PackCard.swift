//
//  PackCard.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct PackCard: View {

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.init(uiColor: UIColor(named: "DarkGrey")!).ignoresSafeArea()
                Text("HELlo WORLD").foregroundStyle(.white)
            }

            Constants.Colors.grey00
                .frame(height: 112)
                .opacity(1)
        }
        .ignoresSafeArea(edges: .bottom)
    }

}



#Preview {
    PackCard()
}
