//
//  TabBar.swift
//  All In
//
//  Created by Peter Bidoshi  on 3/17/24.
//

import Foundation
import SwiftUI

struct TabBar: View {

    let page: String
    let tabItemSize: CGFloat = 24

    var body: some View {
        ZStack {
            Constants.Colors.white
            HStack {
                VStack {
                    Image("Home")
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "home" ? Constants.Colors.red: Constants.Colors.grey02)
                    Text("Home")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.brown)
                    
                }
                Spacer()
                VStack {
                    Image("Market")
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "Marketplace" ? Constants.Colors.red: Constants.Colors.grey02)
                    Text("Marketplace")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.brown)
                    
                }
                Spacer()
                VStack {
                    Image("Person")
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "profile" ? Constants.Colors.red: Constants.Colors.grey02)
                    Text("Profile")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.brown)
                    
                }
            }
            .padding(EdgeInsets(top: 0, leading: 58, bottom: 38, trailing: 58))
        }
    }
}

#Preview {
    TabBar(page: "home")
}
