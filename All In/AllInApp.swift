//
//  All_InApp.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI

@main
struct AllInApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProfileViewViewModel())
        }
    }
}
