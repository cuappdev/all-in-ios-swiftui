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
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "home" ? Constants.Colors.red: Constants.Colors.grey03)
                    Text("Home")
                        .font(.system(size: 12, weight: .regular))
//                        .foregroundStyle(.brown)
                        .foregroundStyle(page == "home" ? Constants.Colors.red: Constants.Colors.grey03)
                    
                }
                Spacer()
                VStack {
                    Image("Market")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "market" ? Constants.Colors.red: Constants.Colors.grey03)
                    Text("Marketplace")
                        .font(.system(size: 12, weight: .regular))
//                        .foregroundStyle(.brown)
                        .foregroundStyle(page == "market" ? Constants.Colors.red: Constants.Colors.grey03)
                    
                }
                Spacer()
                VStack {
                    Image("Person")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: tabItemSize, height: tabItemSize)
                        .foregroundStyle(page == "profile" ? Constants.Colors.red: Constants.Colors.grey03)
                    Text("Profile")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(page == "profile" ? Constants.Colors.red: Constants.Colors.grey03)
                    
                }
            }
            .padding(EdgeInsets(top: 0, leading: 58, bottom: 38, trailing: 58))
        }
    }
}

#Preview {
    TabBar(page: "market")
}
