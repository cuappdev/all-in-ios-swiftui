//
//  HomeView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.init(uiColor: UIColor(named: "DarkGrey")!).ignoresSafeArea()
                Text("HELlo WORLD").foregroundStyle(.white)
            }

            Constants.Colors.grey0
                .frame(height: 112)
                .opacity(1)
        }
        .ignoresSafeArea(edges: .bottom)
    }

}
