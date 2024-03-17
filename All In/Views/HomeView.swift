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
                Constants.Colors.grey00.ignoresSafeArea()
                Text("HELlo WORLD").foregroundStyle(.white)
            }

            Constants.Colors.grey02
                .frame(height: 108)
                .opacity(1)
                .shadow(color: .gray, radius: 15)
        }
        .ignoresSafeArea(edges: .bottom)
    }

}

#Preview {
    HomeView()
}
