//
//  ProfileView.swift
//  All In
//
//  Created by Antoinette Marie Torres on 4/5/24.
//

import SwiftUI

struct ProfileView: View {

    // change this to change the tab programatically
    @Binding var tabSelection: Int

    @State private var user: User
    @State private var editingUsername = false
    @State private var editedUsername: String

    init(tabSelection: Binding<Int>, user: User) {
        _user = State(initialValue: user)
        _tabSelection = tabSelection
        _editedUsername = State(initialValue: user.username)
    }
    
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
                            Text(user.balance.withCommas())
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
                                    HStack {
                                        if editingUsername {
                                            TextField("Username", text: $editedUsername)
                                                .font(.system(size: 20, weight: .semibold))
                                                .foregroundStyle(.gray)
                                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                                .frame(maxWidth: UIScreen.main.bounds.width / 3)
                                        } else {
                                            Text(user.username)
                                                .font(.system(size: 22, weight: .semibold))
                                                .padding(.bottom, 2)
                                        }
                                        Button ( action: {
                                            // If editing username, saves the edited name by creating a new User
                                            if editingUsername {
                                                user = User (
                                                    id: user.id,
                                                    username: editedUsername,
                                                    email: user.email,
                                                    balance: user.balance,
                                                    contracts: user.contracts,
                                                    sellerTransations: user.sellerTransations,
                                                    buyerTransactions: user.buyerTransactions
                                                )
                                            }
                                            editingUsername.toggle()
                                        }) {
                                            Image(systemName: editingUsername ? "checkmark" : "pencil")
                                                .foregroundColor(.red)
                                                .padding(.bottom, 2)
                                        }
                                    }
                                    Text("Active Contracts: 5 \nPast Contracts: 10")
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundStyle(.black)
                                }
                            }
                            .padding(EdgeInsets(top: 14, leading: 26, bottom: 8, trailing: 26))
                            Divider()
                                .frame(width: geometry.size.width / 1.17)
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(user.contracts) { contract in
                                    ContractCard(contract: contract)
                                }
                                .cornerRadius(16)
                            }
                            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
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
    ProfileView(tabSelection: .constant(0), user: User.dummyData[0])
}

