//
//  SheetView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/20/24.
//

import SwiftUI

struct SheetView: View {

    let title: String
    let subTitle: String
    let description: String
    let buttonText: String
    var buttonCallback: (() -> Void)?

    var extras: AnyView = AnyView(EmptyView())

    @Binding var showSheet: Bool

    var body: some View {
        VStack() {
            HStack {
                Text(title)
                Text(subTitle)
                    .foregroundStyle(Constants.Colors.grey02)
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Circle()
                        .foregroundStyle(Constants.Colors.grey01)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Image("X")
                        }
                }
            }
            .font(Constants.Fonts.header)
            extras
            Spacer()
            Text(description)
                .font(Constants.Fonts.bodyBold)
                .foregroundStyle(Constants.Colors.grey02)
            Button {
                buttonCallback?()
            } label: {
                Text(buttonText)
                    .font(Constants.Fonts.subheader)
                    .foregroundStyle(Constants.Colors.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 52, alignment: .center)
            .background(Constants.Colors.red)
            .cornerRadius(100)
        }
        .padding(25)
    }

}

#Preview {
    SheetView(title: "P. Bidoshi", subTitle: "#10 | PG", description: "The best player on this planet lmao", buttonText: "Buy Now!", showSheet: .constant(true))
}
