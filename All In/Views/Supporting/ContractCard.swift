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
                            Text("4 rebounds")
                        }
                        
                        VStack (alignment: .trailing) {
                            Text("+3.2K")
                            Text("exp. 3/24")
                        }
                    }

                    Spacer()
                    
                    // Player Image
                    Image("PlayerCManon")
                        .resizable()
                        .frame(width: 133, height: 164)
                    
                    
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
