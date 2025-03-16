//
//  ToggleCheckboxStyle.swift
//  All In
//
//  Created by Hsia Lu wu on 3/9/25.
//

import Foundation
import SwiftUI

struct ToggleCheckboxStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {

        Button {
            configuration.isOn.toggle()
        } label: {
            Image(systemName: "checkmark.square")
                .symbolVariant(configuration.isOn ? .fill : .none)
        }
        .tint(Color.gray)
    }
}

//extension ToggleStyle where self == ToggleCheckboxStyle {
//    static var checklist: ToggleCheckboxStyle { .init() }
//}
