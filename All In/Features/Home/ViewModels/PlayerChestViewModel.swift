//
//  PlayerChestViewModel.swift
//  All In
//
//  Created by Caitlyn Jin on 10/26/24.
//

import Foundation
import SwiftUI

extension PlayerChestView {

    @MainActor
    class ViewModel: ObservableObject {

        // MARK: - Properties

        @Published var chestPlayer = Image("")

        // MARK: - Requests

        func getUserImage() {
//            NetworkManager.shared.getUserImage(completion: { image in
//                self.chestPlayer = Image(uiImage: image)
//            })
        }

    }

}
