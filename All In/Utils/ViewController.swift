//
//  ViewController.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SwiftUI
import UIKit

/// Wrapper used to convert UIKit View Controllers to Swift UI View.
struct ViewController: UIViewControllerRepresentable {

    private let viewController: UIViewController

    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // DO NOTHING
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return viewController
    }

}


