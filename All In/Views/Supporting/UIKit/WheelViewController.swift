//
//  WheelViewController.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SwiftUI
import UIKit

struct WheelViewController: UIViewControllerRepresentable {

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // DO NOTHING
    }

    func makeUIViewController(context: Context) -> UIViewController {
        return UIWheelViewController()
    }

}


