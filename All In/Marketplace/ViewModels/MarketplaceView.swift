//
//  Marketplace.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct MarketplaceView: View {

    // change this to change the tab programatically
    @Binding var tabSelection: Int

    @State var searchText: String = ""
    @State var selectedStat: Stat = .points
    @State private var selectedRarity: Rarity?

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var filteredContracts: [Contract] {
            let query = searchText.lowercased()
            return Contract.dummyData.filter { contract in
                guard let player = Player.dummyData.first(where: { $0.id == contract.playerId }) else {
                    return false
                }
                let playerName = "\(player.firstName) \(player.lastName)".lowercased()

                return (searchText.isEmpty ||
                    playerName.contains(query) ||
                    player.hometown.lowercased().contains(query) ||
                    contract.opposingTeam.lowercased().contains(query) ||
                    contract.event.lowercased().contains(query) ||
                    "\(contract.eventThreshold)".contains(searchText)) &&
                    (selectedRarity == nil || contract.rarity == selectedRarity)
            }
        }

    var body: some View {

        // Header
        VStack(spacing: 0) {
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
                        Text(1000.withCommas())
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.black)
                    }
                }
                .padding()
            }
            Divider()

            // Main frontend
            ScrollView {
                ZStack {
                    Constants.Colors.grey00
                    
                    VStack {
                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(searchText.isEmpty ? Constants.Colors.grey03 : Constants.Colors.red)
                            TextField("Search", text: $searchText)
                                .foregroundColor(Constants.Colors.grey03)
                                .overlay(Image(systemName: "x.circle.fill")
                                    .offset(x: 8)
                                    .opacity(searchText.isEmpty ? 0.0 : 1.0)
                                    .onTapGesture {
                                        searchText = ""
                                    }
                                         ,alignment: .trailing
                                )
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Constants.Colors.white)
                                .stroke(Constants.Colors.grey02, lineWidth: 1)
                        )
                        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                        PillSelectView(Stat.getAll()) { newStat in
                            selectedStat = newStat
                        }
                        .padding(EdgeInsets(top: -8, leading: -8, bottom: -8, trailing: -8))
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(filteredContracts, id: \.id) { contract in ContractCard(contract: contract)
                            }
                            .cornerRadius(16)
                        }
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                }
            }
        }

            // Tab logic
            TabBar(page: "market")
                .frame(height: 108)
        }
        .ignoresSafeArea(edges: .all)
        .background(Constants.Colors.grey00)
    }

}

#Preview {
    MarketplaceView(tabSelection: .constant(0))
}
