//
//  PillSelectView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/21/24.
//

import SwiftUI

struct PillSelectView: View {

    let pills: [Stat]
    @State var selectedIndex = -1

    let completion: (Stat) -> Void

    init(_ pills: [Stat], completion: @escaping (Stat) -> Void) {
        self.pills = pills
        self.completion = completion
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(pills.indices, id: \.self) { index in
                    ZStack {
                        Text("\(pills[index].getAbv())")
                            .font(Constants.Fonts.bodyBold)
                            .foregroundStyle(index != selectedIndex ? Constants.Colors.black : Constants.Colors.white)
                            .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                            .background {
                                RoundedRectangle(cornerRadius: 50)
                                    .fill(index != selectedIndex ? Constants.Colors.grey01 : Constants.Colors.black)
                            }
                    }
                    .onTapGesture {
                        selectedIndex = index
                        completion(pills[index])
                    }
                }
            }
        }
    }
}
