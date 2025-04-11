//
//  SuccessfullyBuyContractView.swift
//  All In
//
//  Created by Hsia Lu wu on 4/11/25.
//

import SwiftUI

struct SuccessfullyBuyContractView: View {
    let contract: Contract
    let player: Player
    let user: User

    @Environment(\.dismiss) private var dismiss
    @State private var navigateToMarketplace = false
    
    init(contract: Contract, user: User) {
        self.contract = contract
        self.player = Contract.getPlayer(contract)
        self.user = user
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        navigateToMarketplace = true
                    }) {
                        Image(systemName: "xmark")
                            .foregroundStyle(Constants.Colors.white)
                            .padding()
                            .background(Constants.Colors.background)
                            .clipShape(Circle())
                    }
                    .padding([.top, .trailing], 16)
                }
                
                Text("Congratulations! You have purchased a new contract.")
                    .font(Constants.Fonts.headerProfile)
                    .foregroundStyle(Constants.Colors.white)
                
                ContractCard(contract: contract) {
                    // do nothing
                }
                
                Button {
                    navigateToMarketplace = true
                } label: {
                    Text("Return to Marketplace")
                        .font(Constants.Fonts.rankingPill)
                        .foregroundStyle(Constants.Colors.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 64)
                        .background(
                            LinearGradient(
                                 gradient: Constants.Colors.gradient,
                                 startPoint: .topLeading,
                                 endPoint: .bottomTrailing
                             )
                        )
                        .cornerRadius(12)
                }
                .padding(24)
            }
            .background(Constants.Colors.background)
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToMarketplace) {
                MarketplaceView()
                    .environmentObject(ProfileViewViewModel())
                    .environmentObject(TabNavigationManager())
            }
        }
    }
}

#Preview {
    SuccessfullyBuyContractView(contract: Contract.dummyData[0], user: User.dummyData[0])
}
