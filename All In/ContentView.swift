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
                Group {

                    HomeView()
                    .tabItem {
                        Image(systemName: "info.square")
                            .font(.title)
                    }

                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }

                    HomeView()
                        .tabItem {
                            Image(systemName: "person.crop.circle")
                        }
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
