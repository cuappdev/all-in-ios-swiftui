//
//  All_InApp.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/3/24.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct AllInApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProfileViewViewModel())
                .environmentObject(TabNavigationManager())
                .onAppear {
                    Task {
                        do {
                            try await GoogleAuthManager.shared.refreshSignInIfNeeded()
                        } catch {
                            try await GoogleAuthManager.shared.signIn()
                        }
                    }
                }
        }
    }

}

// MARK: - AppDelegate

class AppDelegate: NSObject, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        guard let clientID = FirebaseApp.app()?.options.clientID else { return false }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.configuration = config
        return true
    }

}
