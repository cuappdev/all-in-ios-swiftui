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
                Constants.Colors.grey0.ignoresSafeArea()
                
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
                    
                    
                    
                    
                    Spacer()
                    
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
