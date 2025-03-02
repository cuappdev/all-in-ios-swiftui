//
//  CartView.swift
//  All In
//
//  Created by Hsia Lu wu on 3/2/25.
//
import SwiftUI

struct CartView: View {

    @State var contracts: [Contract]

    var body: some View {
        VStack {

            HStack {
                Text("Cart")
                    .font(Constants.Fonts.header)
                
                Spacer()
            }
            .padding(.leading, 19)

            HStack {
                Text("Game")

                Spacer()

                Text("Parlay")
            }
            .padding(.leading, 19)
            .padding(.trailing, 19)

            Divider()
                .overlay(Color.gray)
                .padding(.leading, 19)
                .padding(.trailing, 19)
            // contract tile
            
            ForEach(contracts) {
                contract in
                ContractTile(contract: contract)
                
                Divider()
                    .overlay(Color.gray)
                    .padding(.horizontal, 19)
            }
        }
    }

}

#Preview {
    CartView(contracts: Contract.dummyData)
}
