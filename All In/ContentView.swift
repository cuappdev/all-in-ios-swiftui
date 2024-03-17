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
            TabView {
                HomeView()
                    .tabItem {
                        EmptyView()
                    }

                Text("POOP")
                    .tabItem {
                        EmptyView()
                    }

                Text("poop2")
                    .tabItem {
                        EmptyView()
                    }
            }
            .onAppear {
                UITabBar.appearance().unselectedItemTintColor = .white
            }
        }
    }

}

#Preview {
    ContentView()
}
