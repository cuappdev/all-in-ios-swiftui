//
//  CartView.swift
//  All In
//
//  Created by jiwon jeong on 4/10/25.
//

import SwiftUI

struct CartView: View {

    // MARK: - Properties

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: CartViewModel

    let user: User

    init(user: User, viewModel: CartViewModel? = nil) {
        self.user = user
        self.viewModel = viewModel ?? CartViewModel(user: user)
    }

    // MARK: - UI 

    var body: some View {
        ZStack {
            Constants.Colors.backgroundBlack.ignoresSafeArea()

            VStack(spacing: 0) {
                HStack {
                    Text("Cart")
                        .font(Constants.Fonts.headerProfile)
                        .foregroundStyle(Constants.Colors.white)

                    Spacer()

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 20)

                HStack {
                    Spacer()

                    HStack(spacing: 4) {
                        Image(systemName: "dollarsign.circle")
                            .foregroundStyle(Constants.Colors.white)

                        Text("\(viewModel.user.balance)")
                            .foregroundStyle(Constants.Colors.white)
                            .font(Constants.Fonts.subheaderProfile)
                    }

                }
                .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 24) {
                        if !viewModel.homeItems.isEmpty {
                            cartSection(
                                title: "Home",
                                items: viewModel.homeItems,
                                totalAmount: viewModel.homeTotalAmount
                            )
                        }

                        if !viewModel.marketplaceItems.isEmpty {
                            cartSection(
                                title: "Marketplace",
                                items: viewModel.marketplaceItems,
                                totalAmount: viewModel.marketplaceTotalAmount,
                                showWinnings: true,
                                potentialWin: viewModel.potentialWinnings
                            )
                        }

                        if !viewModel.homeItems.isEmpty || !viewModel.marketplaceItems.isEmpty {
                            totalsSection()
                        }
                    }
                    .padding(.top, 20)
                }

                confirmButton()
            }
        }

    }

    private func cartSection(
        title: String,
        items: [CartItem],
        totalAmount: Int,
        showWinnings: Bool = false,
        potentialWin: Int = 0
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(Constants.Fonts.subheader)
                .foregroundStyle(Constants.Colors.white)

            VStack(spacing: 12) {
                ForEach(items) { item in
                    cartItemRow(item: item)
                }
            }

            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Constants.Colors.gradient,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 1)

            HStack {
                Text("Amount")
                    .font(Constants.Fonts.faqDetail)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                if showWinnings {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("$\(totalAmount)")
                            .font(Constants.Fonts.faqDetail)
                            .foregroundStyle(Constants.Colors.white)

                        Text("Win $\(potentialWin) if \(items.count > 1 ? "all" : "") true")
                            .font(Constants.Fonts.caption)
                            .foregroundStyle(Constants.Colors.white)
                    }
                } else {
                    Text("$\(totalAmount)")
                        .font(Constants.Fonts.faqDetail)
                        .foregroundStyle(Constants.Colors.white)
                }
            }
        }
        .padding(.horizontal)
    }

    private func cartItemRow(item: CartItem) -> some View {
        HStack {
            Button {
                viewModel.toggleItemSelection(item: item)
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .strokeBorder(                item.isSelected ?
                            Constants.Colors.cartLightBlue : Constants.Colors.cartBlue, lineWidth: 2)
                        .frame(width: 20, height: 20)
                        .background(
                            item.isSelected ? Constants.Colors.cartLightBlue : Constants.Colors.cartBlue
                        )
                        .cornerRadius(4)

                    if item.isSelected {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                if item.itemType == .rarityPack {
                    Text("\(item.name)")
                        .font(Constants.Fonts.faqDetail)
                        .foregroundStyle(item.rarity?.getColor() ?? Constants.Colors.white)

                    Text("Rarity Pack")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.grey03)
                } else {
                    Text("\(item.name)")
                        .font(Constants.Fonts.faqDetail)
                        .foregroundStyle(Constants.Colors.white)

                    if let eventDesc = item.eventDescription {
                        Text(eventDesc)
                            .font(Constants.Fonts.caption)
                            .foregroundStyle(Constants.Colors.grey03)
                    }
                }
            }

            Spacer()

            if item.itemType == .marketplaceContract, let potentialWin = item.potentialWin {
                VStack(alignment: .trailing, spacing: 2) {
                    Text("$\(item.price)")
                        .font(Constants.Fonts.bodyBold)
                        .foregroundStyle(Constants.Colors.white)

                    Text("Win $\(potentialWin) if true")
                        .font(Constants.Fonts.caption)
                        .foregroundStyle(Constants.Colors.white)
                }
            } else {
                Text("$\(item.price)")
                    .font(Constants.Fonts.bodyBold)
                    .foregroundStyle(Constants.Colors.white)
            }
        }
    }

    private func totalsSection() -> some View {
        VStack(spacing: 12) {
            Text("Totals")
                .font(Constants.Fonts.subheader)
                .foregroundStyle(Constants.Colors.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack {
                Text("Home bets total")
                    .font(Constants.Fonts.cart)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Text("$\(viewModel.homeTotalAmount)")
                    .font(Constants.Fonts.faqDetail)
                    .foregroundStyle(Constants.Colors.white)
            }

            HStack {
                Text("Marketplace bets total")
                    .font(Constants.Fonts.cart)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text("$\(viewModel.marketplaceTotalAmount)")
                        .font(Constants.Fonts.bodyBold)
                        .foregroundStyle(Constants.Colors.white)

                    if viewModel.potentialWinnings > 0 {
                        Text("Win $\(viewModel.potentialWinnings) if all true")
                            .font(Constants.Fonts.caption)
                            .foregroundStyle(Constants.Colors.white)
                    }
                }
            }
        }
        .padding()
    }

    private func confirmButton() -> some View {
        Button {
            viewModel.confirmPurchase()
            dismiss()
        } label: {
            Text("Confirm to Spend $\(viewModel.totalAmount)")
                .font(Constants.Fonts.bodyBold)
                .foregroundStyle(Constants.Colors.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        gradient: Constants.Colors.gradient,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 16)
        }
        .disabled(viewModel.totalAmount == 0)
        .opacity(viewModel.totalAmount == 0 ? 0.5 : 1.0)
    }
}

#Preview {
    CartView(user: User.dummyData[0])
}
