//
//  SignInManager.swift
//  All In
//
//  Created by Peter Bidoshi on 4/9/25.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import os
import UIKit

class GoogleAuthManager {

    // MARK: - Singleton Instance

    static let shared = GoogleAuthManager()

    // MARK: - Error Logger for Google Auth

    let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.cornellappdev.AllIn", category: #file)

    // MARK: - Properties

    var accessToken: String?
    var user: User?

    // MARK: - Init

    private init() { }

    // MARK: - Functions

    @MainActor
    func signIn() async throws {
        guard let presentingViewController = await (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else { return }

        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController)
        try await getCredentialsFromGoogleUser(user: gidSignInResult.user)
        self.user = try await NetworkManager.shared.authorize()?.user
    }

    /// Try to refresh the access token of the current user if it exists, or the restored user.
    /// If this function throws a full logout is needed.
    func refreshSignInIfNeeded() async throws {
        // Restore or verify sign-in
        if GIDSignIn.sharedInstance.currentUser == nil {
            try await GIDSignIn.sharedInstance.restorePreviousSignIn()
        }

        // Get current user or throw
        guard let currentUser = GIDSignIn.sharedInstance.currentUser else {
            throw GoogleAuthError.noUserSignedIn
        }

        // Refresh tokens
        try await currentUser.refreshTokensIfNeeded()

        try await getCredentialsFromGoogleUser(user: currentUser)
        self.user = try await NetworkManager.shared.authorize()?.user
    }

    func getCredentialsFromGoogleUser(user: GIDGoogleUser) async throws {
        guard let idToken = user.idToken?.tokenString else {
            // TODO: Throw a better error
            throw GoogleAuthError.noUserSignedIn
        }

        // Convert to firebase credential
        let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
        let authResult = try await Auth.auth().signIn(with: credentials)

        // Update accessToken and authorize the user with backend
        self.accessToken = try await Auth.auth().currentUser?.getIDToken(forcingRefresh: true)
    }

    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        accessToken = nil
    }

}

enum GoogleAuthError: Error, LocalizedError {

    case noUserSignedIn

    var errorDescription: String? {
        switch self {
        case .noUserSignedIn:
            return "No user is currently signed in."
        }
    }

}
