//
//  Marketplace.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct MarketplaceView: View {

    @StateObject var marketplaceViewModel = MarketplaceViewModel()
    @EnvironmentObject var profileViewModel: ProfileViewViewModel
    @State var selectedStat: Stat = .points
    @State private var showingFAQ = false

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

//    let user: User

    // MARK: UI

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    pageInformation
//                    Divider()
//                    content
                    searchBar
                    recommendedContracts
//                    allContracts
                }
                .padding(24)
            }
//            .ignoresSafeArea(edges: .top)
            .background(Constants.Colors.background)
        }
    }

    private var pageInformation: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack {
                Text("Marketplace")
                    .font(Constants.Fonts.headerProfile)
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Button(action: {
                    showingFAQ = true
                }) {
                    Image(systemName: "questionmark.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 24))
                }
            }

            HStack {
                Spacer()

                HStack(spacing: 7) {
                    Image(systemName: "dollarsign.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 24))

                    // TODO: Fix
                    Text(profileViewModel.user.balance.withCommas())
                        .font(Constants.Fonts.subheaderProfile)
                        .foregroundStyle(Constants.Colors.white)
                }
            }
        }
    }

    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    marketplaceViewModel.searchText.isEmpty ? Constants.Colors.grey03 : Constants.Colors.red
                )
            TextField("Search", text: $marketplaceViewModel.searchText)
                .foregroundColor(Constants.Colors.grey03)
                .overlay(
                    Image(
                        systemName: "x.circle.fill"
                    )
                    .offset(x: 8)
                    .opacity(marketplaceViewModel.searchText.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        marketplaceViewModel.searchText = ""
                    },
                    alignment: .trailing
                )
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Constants.Colors.grey02, lineWidth: 1)
        )
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(Constants.Colors.white)
        )
    }

    private var recommendedContracts: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Your Recommended Contracts")
                    .font(Constants.Fonts.mainHeader)
                    .foregroundStyle(Constants.Colors.white)
                // NOTE: Uncomment if we want to bring it to a separate page
//                Image(systemName: "chevron.right")
//                    .foregroundStyle(Constants.Colors.white)
//                    .font(.system(size: 12))
                Spacer()
            }

        }
    }

    private var allContracts: some View {
        ScrollView {
            ZStack {
                Constants.Colors.background

                VStack {
                    PillSelectView(Stat.getAll()) { newStat in
                        selectedStat = newStat
                    }
                    .padding(EdgeInsets(top: -8, leading: -8, bottom: -8, trailing: -8))
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(marketplaceViewModel.filteredContracts, id: \.id) { contract in ContractCard(contract: contract)
                        }
                        .cornerRadius(16)
                    }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                }
            }
        }
    }

}

#Preview {
    MarketplaceView()
        .environmentObject(ProfileViewViewModel())
}
