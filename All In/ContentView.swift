//
//  ContentView.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

struct ContentView: View {

    let tabItemSize: CGFloat = 48

    var body: some View {
        ZStack {
            TabView {
                Group {
                    HomeView()
                        .tabItem {
                            Image("Home")
                        }

                    HomeView()
                        .tabItem {
                            Image("Person")
                                .resizable()
                                .frame(width: tabItemSize, height: tabItemSize)
                        }

                    HomeView()
                        .tabItem {
                            Image("Market")
                                .resizable()
                                .frame(width: tabItemSize, height: tabItemSize)
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
