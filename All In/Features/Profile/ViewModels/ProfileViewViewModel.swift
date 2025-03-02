//
//  ProfileViewViewModel.swift
//  All In
//
//  Created by Hsia Lu wu on 11/3/24.
//

import Foundation
import SwiftUI

@MainActor
class ProfileViewViewModel: ObservableObject {

    // MARK: Properties
    @Published var user: User

    init() {
        user = User.dummyData[0]
    }

}
