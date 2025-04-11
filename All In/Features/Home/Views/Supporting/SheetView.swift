//
//  SheetView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/20/24.
//

import SwiftUI

struct SheetView<Extras>: View where Extras: View {

    let title: String
    let subTitle: String
    let description: String
    let price: Int
    let buttonText: String
    var buttonCallback: (() -> Void)?

    @Binding var showSheet: Bool

    @ViewBuilder var extras: () -> Extras

    init(
        title: String,
        subTitle: String,
        description: String,
        buttonText: String,
        price: Int,
        showSheet: Binding<Bool>,
        extras: @escaping () -> Extras,
        buttonCallback: (() -> Void)? = nil

    ) {
        self.title = title
        self.subTitle = subTitle
        self.description = description
        self.buttonText = buttonText
        self.price = price
        _showSheet = showSheet
        self.extras = extras
        self.buttonCallback = buttonCallback
    }

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(Constants.Colors.white)
                Text(subTitle)
                    .foregroundStyle(Constants.Colors.white)
                Spacer()
                Button {
                    showSheet = false
                } label: {
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(Constants.Colors.white)

                }
            }
            .font(Constants.Fonts.header)

            extras()

            HStack {
                Image("Money")
                    .resizable()
                    .frame(width: 24, height: 24)

                Text("\(price)")
                    .foregroundStyle(Constants.Colors.white)
                    .font(Constants.Fonts.profileCard)
            }
            .padding(.top, 20)

            Text(description)
                .font(Constants.Fonts.bodyBold)
                .foregroundStyle(Constants.Colors.grey02)

            Button {
                buttonCallback?()
            } label: {
                Text(buttonText)
                    .font(Constants.Fonts.body)
                    .foregroundStyle(Constants.Colors.black)
            }
            .frame(maxWidth: .infinity, maxHeight: 52, alignment: .center)
            .background(LinearGradient(gradient: Constants.Colors.gradient, startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(12)
            .padding(.top, 20)
        }
        .padding(25)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Constants.Colors.background)
    }

}

#Preview {
    SheetView(
        title: "P. Bidoshi",
        subTitle: "#10 | PG",
        description: "The best player on this planet lmao",
        buttonText: "Buy Now!",
        price: 1720,
        showSheet: .constant(true)
    ) {
        VStack {
            Image("Chest")
                .resizable()
                .frame(width: 300, height: 300)
        }
    }
}
