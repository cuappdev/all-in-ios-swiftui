//
//  ProfileView.swift
//  All In
//
//  Created by Antoinette Marie Torres on 4/5/24.
//

import SwiftUI

struct ProfileView: View {

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        GeometryReader { geometry in
            
            // Header
            VStack(spacing: 0) {
                ZStack(alignment: .bottomLeading) {
                    Constants.Colors.white
                        .frame(height: 129)
                    HStack(alignment: .center) {
                        Text("Profile")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundStyle(.black)
                        Spacer()
                        HStack {
                            Image("RedMoney")
                            Text("1,000")
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
                            HStack(alignment: .center, spacing: 28) {
                                Image("profile-test")
                                    .frame(width: 125, height: 125)
                                    .background(.white)
                                    .cornerRadius(100)
                                    .shadow(color: .black.opacity(0.25), radius: 2)
                                VStack(alignment: .leading) {
                                    Text("Anton Matchev")
                                        .font(.system(size: 24, weight: .semibold))
                                    Text("Active Contracts: 5")
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundStyle(.black)
                                    Text("Past Contracts: 10")
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundStyle(.black)
                                }
                            }
                            .padding(EdgeInsets(top: 14, leading: 26, bottom: 8, trailing: 26))
                            Divider()
                                .frame(width: geometry.size.width / 1.17)
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(Contract.dummyData) { contract in
                                    ContractCard(contract: contract)
                                }
                            }.padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                        }
                    }
                }
                
                // Tab logic
                TabBar(page: "profile")
                    .frame(height: 108)
            }
            .ignoresSafeArea(edges: .all)
        }
    }

}

#Preview {
    ProfileView()
}

