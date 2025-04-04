//
//  RarityPackSheetView.swift
//  All In
//
//  Created by jiwon jeong on 4/2/25.
//

import SwiftUI

struct RarityPackSheetView: View {
    @StateObject private var viewModel = ViewModel()
    @Binding var showSheet: Bool

    let rarity: Rarity

    private func getPriceForRarity(_ rarity: Rarity) -> Int {
        switch rarity {
        case .common:
            return 1_720
        case .rare:
            return 2_500
        case .epic:
            return 3_800
        case .legendary:
            return 5_000
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("\(rarity.rawValue.prefix(1).uppercased() + rarity.rawValue.dropFirst().lowercased()) Pack")
                    .font(Constants.Fonts.mainCardHeader)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Button(action: {
                    showSheet = false
                }) {
                    Image(systemName: "xmark")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 16, weight: .semibold))
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, 24)

            rarity.getPackImage()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 164, height: 164)

            VStack(spacing: 10) {
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 18))

                    Text("\(getPriceForRarity(rarity))")
                        .font(Constants.Fonts.subheaderProfile)
                        .foregroundStyle(Constants.Colors.white)
                }

                Text("contains a \(rarity.rawValue.lowercased()) contract")
                    .font(Constants.Fonts.sheetDescription)
                    .foregroundStyle(Constants.Colors.grey03)
            }

            Button(action: {
                viewModel.getRarityContract(rarity: rarity)
            }) {
                Text("Buy Now")
                    .font(Constants.Fonts.sheetBuy)
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
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity)
        .background(Constants.Colors.backgroundBlack)
        .sheet(isPresented: $viewModel.showWheelSpin) {
            WheelSpinSheet(winningContract: $viewModel.returnedContract)
                .presentationDetents([.fraction(0.45)])
        }
    }
}

#Preview{
    RarityPackSheetView(showSheet: .constant(true), rarity: .common)
}
