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
                Color.init(uiColor: UIColor(named: "DarkGrey")!).ignoresSafeArea()
                Text("C. Manon")
            }
            .frame(width: 180, height: 254)
            .cornerRadius(10)
            
        }
        
    }

}

#Preview {
    ContractCard()
}
