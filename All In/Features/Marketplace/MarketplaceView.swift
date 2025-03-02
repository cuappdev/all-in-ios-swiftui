//
//  Marketplace.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct MarketplaceView: View {

    @StateObject var viewModel = ViewModel()
    @EnvironmentObject var profileViewModel: ProfileViewViewModel

    // TODO: change this to change the tab programatically
    @Binding var tabSelection: Int
    @State var selectedStat: Stat = .points

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {

        VStack(spacing: 0) {
            header

            Divider()

            content

            TabBar(page: "market")
                .frame(height: 108)
        }
        .ignoresSafeArea(edges: .all)
        .background(Constants.Colors.grey00)
    }

    private var header: some View {
        ZStack(alignment: .bottomLeading) {
            Constants.Colors.white
                .frame(height: 129)
            HStack(alignment: .center) {
                Text("Marketplace")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.black)
                Spacer()
                HStack {
                    Image("RedMoney")
                    Text(profileViewModel.user.balance.withCommas())
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.black)
                }
            }
            .padding()
        }
    }

    private var content: some View {
        ScrollView {
            ZStack {
                Constants.Colors.grey00

                VStack(alignment: .leading) {
                    // (1) Search bar implementation.
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(
                                viewModel.searchText.isEmpty ? Constants.Colors.grey03 : Constants.Colors.red
                            )
                        TextField("Search", text: $viewModel.searchText)
                            .foregroundColor(Constants.Colors.grey03)
                            .overlay(
                                Image(
                                    systemName: "x.circle.fill"
                                )
                                .offset(x: 8)
                                .opacity(viewModel.searchText.isEmpty ? 0.0 : 1.0)
                                .onTapGesture {
                                    viewModel.searchText = ""
                                },
                                alignment: .trailing
                            )
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Constants.Colors.grey02, lineWidth: 1)
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Constants.Colors.white)
                    )
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    // (2) Upcoming games carousel implementation.
                    Text("Upcoming Games")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 8, trailing: 0))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(Contract.dummyData[0..<5]) { contract in
                                ContractCard(contract: contract)
                                    .cornerRadius(16)
                            }
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                    }
                    // (3) Game filter implementation.
                    PillSelectView(Stat.getAll()) { newStat in
                        selectedStat = newStat
                    }
                    .padding(EdgeInsets(top: -8, leading: -8, bottom: -8, trailing: -8))
                    // (4) Popular contracts implementation.
                    Text("Popular Contracts")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(viewModel.filteredContracts, id: \.id) { contract in ContractCard(contract: contract)
                            }
                        }
                    }
                    // (5) All players implementation.
                    Text("All Players")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 0))
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredContracts, id: \.id) { contract in ContractCard(contract: contract)
                        }
                        .cornerRadius(16)
                    }
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                }
            }
        }
    }
}

// Ignore this for now. Needed to fix preview. (Ant)
#Preview {
    MarketplaceView(tabSelection: .constant(0)).environmentObject(ProfileViewViewModel())
}
