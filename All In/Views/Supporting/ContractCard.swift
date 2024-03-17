//
//  ContractCard.swift
//  All In
//
//  Created by Daniel Chuang on 3/17/24.
//

import SwiftUI

struct ContractCard: View {

    var body: some View {
        VStack{
            ZStack{
                Constants.Colors.grey00.ignoresSafeArea()
                
                // Card Content VStack
                VStack {
                    
                    // Header
                    HStack {
                        VStack (alignment: .leading) {
                            Text("C. Manon")
                                .font(.system(size: 16, weight: .bold))
                            Text("4 rebounds")
                                .font(.system(size: 10, weight: .semibold))
                                .foregroundStyle(Constants.Colors.grey02)
                        }
                        
                        VStack (alignment: .trailing) {
                            Text("+3.2K")
                                .font(Constants.Fonts.playerHeader)
                            Text("exp. 3/24")
                        }
                    }
                    .padding(EdgeInsets(top: 11, leading: 0, bottom: 0, trailing: 0))

                    Spacer()
                    
                    // Player Image
                    Image("PlayerCManon")
                        .resizable()
                        .frame(width: 133, height: 164)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    
                    Spacer()
                    
                    // Buttons for purchase and info
                    HStack {
                        // Purchase Button
//                        Button(action: ) {
                        Rectangle()
                            .frame(width: 135, height: 29)
                            .cornerRadius(7)
//                        }
                        
                        // Info Button
//                        Button () {
                            Rectangle()
                            .frame(width: 29, height: 29)
                            .cornerRadius(7)
//                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 7, trailing: 0))
                    
                }
                
                // Image
                
                // 
            }
            .frame(width: 180, height: 254)
            .cornerRadius(10)
            
        }
        
    }

}

#Preview {
    ContractCard()
}
