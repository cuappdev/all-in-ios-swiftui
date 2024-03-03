//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.init(uiColor: UIColor(named: "DarkGrey")!).ignoresSafeArea()
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack(spacing: 50) {
                        Image(systemName: "house")
                        Image(systemName: "person.crop.circle")
                    }
                    .foregroundColor(.white)
                }
            }
            .toolbarBackground(<#T##visibility: Visibility##Visibility#>, for: <#T##ToolbarPlacement...##ToolbarPlacement#>)
        }
    }
}

#Preview {
    ContentView()
}
