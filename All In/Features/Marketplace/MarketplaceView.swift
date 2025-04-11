//
//  Marketplace.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct MarketplaceView: View {

    @State var presentPopup = false
    @State private var showFilterPopup = false
    @State private var selectedSport: String?
    @State private var selectedRarity: String?
    @State private var sportFilters = Set<String>()
    @State private var rarityFilters = Set<String>()
    @State private var selectedSort: SortOption?
    @State var priceLowValue: Double = 0
    @State var priceHighValue: Double = 10000
    @State var payoutLowValue: Double = 0
    @State var payoutHighValue: Double = 10000
    
    @StateObject var marketplaceViewModel = MarketplaceViewModel()
    @EnvironmentObject var profileViewModel: ProfileViewViewModel
    @State var selectedStat: Stat = .points
    @State private var showingFAQ = false

    var padding: CGFloat = 24

    var padding: CGFloat = 24
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    // MARK: UI

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    pageInformation
                    searchBar
                    recommendedContracts
                    contractsToday
                    allContracts
                }
                .padding(padding)
                .sheet(isPresented: $presentPopup) {
                    FilterView(
                        presentPopup: $presentPopup,
                        sportFilters: $sportFilters,
                        rarityFilters: $rarityFilters,
                        selectedSort: $selectedSort,
                        selectedSport: $selectedSport,
                        selectedRarity: $selectedRarity,
                        priceLowValue: $priceLowValue,
                        priceHighValue: $priceHighValue,
                        payoutLowValue: $payoutLowValue,
                        payoutHighValue: $payoutHighValue
                    )
                }
            }
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

                    // TODO: Look into?
                    Text(profileViewModel.user.balance.withCommas())
                        .font(Constants.Fonts.subheaderProfile)
                        .foregroundStyle(Constants.Colors.white)
                }
            }
        }
    }

    private var searchBar: some View {
        HStack{
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
                    .padding(.trailing, 50)
                
                Spacer()
                
                
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
            .frame(width: 309)
            Button{
                presentPopup = true
            } label: {
                Image("filterIcon")
            }
            
        }
    }

    private var recommendedContracts: some View {
        VStack(alignment: .leading, spacing: 24) {
            HStack(spacing: 4) {
                Text("Your Recommended Contracts")
                    .font(Constants.Fonts.mainHeader)
                    .foregroundStyle(Constants.Colors.white)
                // NOTE: Comment out for chevron to add page.
//                Image(systemName: "chevron.right")
//                    .foregroundStyle(Constants.Colors.white)
//                    .font(.system(size: 12))
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Contract.dummyData.prefix(5), id: \.id) { contract in
                        ContractCard(contract: contract)
                            .frame(width: 180)
                }
            }

            HStack {
                Spacer()

                HStack(spacing: 7) {
                    Image(systemName: "dollarsign.circle")
                        .foregroundStyle(Constants.Colors.white)
                        .font(.system(size: 24))

                    // TODO: Look into?
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
                    .padding(.trailing, 50)
                
                Spacer()
                
                
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
            .frame(width: 309)
            Button{
                presentPopup = true
            } label: {
                Image("filterIcon")
            }
            
        }
    }

    private var recommendedContracts: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Your Recommended Contracts")
                .font(Constants.Fonts.mainHeader)
                .foregroundStyle(Constants.Colors.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Contract.dummyData.prefix(5), id: \.id) { contract in
                        ContractCard(contract: contract) {
                            selectedContract = contract
                        }
                        .frame(width: 180)
                    }
                }
                .padding(padding)
            }
            .padding(-padding)
        }
        .padding(.top, 16)
    }

    private var contractsToday: some View {
        VStack(alignment: .leading, spacing: 24) {
            NavigationLink {
                ContractsEndingView(contracts: Contract.dummyData.prefix(5).map { $0 })
            } label: {
                HStack {
                    Text("Contracts Ending Today")
                        .gradientForeground(colors: [Constants.Colors.gradientBlue, Constants.Colors.gradientLightBlue, Constants.Colors.gradientLavender, Constants.Colors.gradientPurple])
                        .font(Constants.Fonts.mainHeader)

                    Image(systemName: "chevron.right")
                        .foregroundStyle(Constants.Colors.gradientLightBlue)
                        .font(.system(size: 12))
                }
            }

            // Previous sorting configuration
//            PillSelectView(Stat.getAll()) { newStat in
//                selectedStat = newStat
//            }
//            .padding(EdgeInsets(top: -8, leading: -8, bottom: -8, trailing: -8))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Contract.dummyData, id: \.id) { contract in
                        ContractEndingCard(contract: contract)
                            .frame(width: UIScreen.main.bounds.width - 80)
                    }
                }
                .padding(padding)
            }
            .padding(-padding)
        }
    }

    private var allContracts: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("All Contracts")
                    .font(Constants.Fonts.mainHeader)
                    .foregroundStyle(Constants.Colors.white)

                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: 10),
                        GridItem(.flexible(), spacing: 10)
                    ]
                ) {
                    ForEach(Contract.dummyData.prefix(5), id: \.id) { contract in
                        ContractCard(contract: contract) {
                            selectedContract = contract
                        }
                        .scaleEffect(0.95)
                    }
                }
            }
            .background(Constants.Colors.background)
        }
    }
}

#Preview {
    MarketplaceView()
        .environmentObject(ProfileViewViewModel())
        .environmentObject(TabNavigationManager())
}
