//
//  FilterView.swift
//  All In
//
//  Created by Charles Liggins on 4/10/25.
//

import SwiftUI

struct FilterView: View {

    @Binding var presentPopup: Bool
    @Binding var sportFilters: Set<String>
    @Binding var rarityFilters: Set<String>
    @Binding var selectedSort: SortOption?
    @Binding var selectedSport: String?
    @Binding var selectedRarity: String?
    @Binding var priceLowValue: Double
    @Binding var priceHighValue: Double
    @Binding var payoutLowValue: Double
    @Binding var payoutHighValue: Double
    
    
    @State private var sortByPopup = false
    @State private var alteredState = false
    @State private var showSale = false
   

    private var sports: [String] = ["Basketball", "Hockey", "Baseball", "Swim", "Volleyball", "Track & Field", "Tennis"]
    private var rarities: [String] = ["Common", "Epic", "Rare", "Legendary"]

    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
    ]

    let gridItem = GridItem(.adaptive(minimum: 100), spacing: 10)

    public init(presentPopup: Binding<Bool>, sportFilters: Binding<Set<String>>, rarityFilters: Binding<Set<String>>, selectedSort: Binding<SortOption?>, selectedSport: Binding<String?>, selectedRarity: Binding<String?>, priceLowValue: Binding<Double>, priceHighValue: Binding<Double>, payoutLowValue: Binding<Double>, payoutHighValue: Binding<Double>) {
            self._presentPopup = presentPopup
            self._sportFilters = sportFilters
            self._rarityFilters = rarityFilters
            self._selectedSport = selectedSport
            self._selectedRarity = selectedRarity
            self._selectedSort = selectedSort
            self._priceLowValue = priceLowValue
            self._priceHighValue = priceHighValue
            self._payoutLowValue = payoutLowValue
            self._payoutHighValue = payoutHighValue
        }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Filters")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Constants.Colors.white)

                gradientDivider

                HStack(spacing: 120) {
                    Text("Sort by")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Constants.Colors.white)

                    Button {
                        sortByPopup.toggle()
                    } label: {
                        Text("\(selectedSort?.title ?? "Any")")
                            .font(.custom("Rubik", size: 20))
                            .foregroundStyle(Constants.Colors.white)

                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                            .padding(.leading, -2)
                    }
                }.padding(.top, 12)
                    .frame(width: 320)

                gradientDivider

                VStack(alignment: .leading) {
                    VStack {
                    Text("Price Range")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Constants.Colors.white)                       .padding(.leading, 32)
                            .padding(.bottom, 20)
                            .padding(.top, 16)
                    }

                    // SLIDER
                    RangeSlider(lowValue: $priceLowValue, highValue: $priceHighValue, alteredState: $alteredState, range: 0...10000)
                        .padding(.leading, 32)
                        .offset(y: -20)
                        .padding(.bottom, 20)

                        Text("Payout Range")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Constants.Colors.white)
                            .foregroundStyle(.gray)
                            .padding(.leading, 32)
                            .padding(.bottom, 20)

                    RangeSlider(lowValue: $payoutLowValue, highValue: $payoutHighValue, alteredState:     $alteredState, range: 0...10000)
                        .padding(.leading, 32)
                        .offset(y: -20)
                        .padding(.bottom, 20)

                }

                gradientDivider

                VStack(alignment: .leading) {
                    Text("Sport")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Constants.Colors.white)
                        .padding(.bottom, 8)
                        .padding(.top, 16)
                    FlowLayout(spacing: 10) {
                                      ForEach(sports, id: \.self) { sport in
                                          FilterButton(
                                              title: sport,
                                              isSelected: selectedSport == sport,
                                              type: "Sport",
                                              action: {
                                                  
                                                  if selectedSport == sport {
                                                         selectedSport = nil
                                                      alteredState = true

                                                         sportFilters.remove(sport)
                                                     } else {
                                                         selectedSport = sport
                                                         alteredState = true

                                                         sportFilters = [sport]
                                                     }
                                              }
                                          )
                                      }
                    }
                }
                .padding(.leading, 32)

                gradientDivider

                VStack(alignment: .leading) {
                    Text("Rarity Level")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)
                        .padding(.top, 16)

                    HStack {
                        ForEach(rarities, id: \.self) { rarity in
                            FilterButton(
                                title: rarity,
                                isSelected: selectedRarity == rarity,
                                type: "Rarity",
                                action: {
                                    if selectedRarity == rarity {
                                        selectedRarity = nil
                                            rarityFilters.remove(rarity)
                                        alteredState = true

                                       } else {
                                           selectedRarity = rarity
                                           alteredState = true

                                           rarityFilters = [rarity]
                                       }
                                }
                            )
                        }
                    }
                }.padding(.leading, -20)

                HStack {
                    Button {
                        sportFilters.removeAll()
                        rarityFilters.removeAll()
                        priceLowValue = 0
                        priceHighValue = 10000
                        payoutLowValue = 0
                        payoutHighValue = 10000
                        selectedSport = nil  // Reset the selected sport
                        selectedRarity = nil // Reset the selected rarity
                    } label: {
                        Text("Reset")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.leading, 40)
                            .foregroundStyle(.black)
                    }

                    Spacer()

                    Button {
                        // networking goes here...
                        
                        presentPopup = false
                    } label: {
                            Text("Apply filters")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(sportFilters.isEmpty && rarityFilters.isEmpty && priceLowValue == 0 && priceHighValue == 10000 && payoutLowValue == 0 && payoutHighValue == 10000 && selectedSort == nil || alteredState == false ? .white.opacity(0.4) : .black)
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(
                                    Group {
                                        if sportFilters.isEmpty && rarityFilters.isEmpty && priceLowValue == 0 && priceHighValue == 10000 && payoutLowValue == 0 && payoutHighValue == 10000 && selectedSort == nil || alteredState == false{
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(.gray.opacity(0.2))
                                        } else {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(
                                                    LinearGradient(
                                                        gradient: Constants.Colors.gradient,
                                                        startPoint: .topLeading,
                                                        endPoint: .bottomTrailing
                                                    )
                                                )
                                        }
                                    }
                                )
                                .cornerRadius(20)

                    }
                    .padding(.trailing, 40)
                }
                .padding(.top, 32)
            }

            if sortByPopup {
                SortByView(selectedSort: $selectedSort, alteredState: $alteredState)
                    .offset(x: 88, y: -180)
                    .onTapGesture {
                        sortByPopup.toggle()
                    }
            }
        }
        .frame(width: 412, height: 826.2)
        .background(Constants.Colors.blackBlue)
    }

    var gradientDivider: some View {
        Rectangle()
            .fill(
                LinearGradient(
                gradient: Constants.Colors.gradient,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
                )
            )
            .frame(height: 1)
            .frame(width: 344)
    }

    struct SortByView: View {
        @Binding var selectedSort: SortOption?
        @Binding var alteredState: Bool

        let sortOptions = [
            SortOption(title: "Any"),
            SortOption(title: "Price: High to Low"),
            SortOption(title: "Price: Low to High")
        ]

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(sortOptions) { option in
                    Button(action: {
                        selectedSort = option
                        alteredState = true
                    
                    }) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(option.title)
                                .font(.system(size: 17, weight: selectedSort == option ? .bold : .regular))
                                .foregroundColor(.white)
                                .padding(.vertical, 12)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            if option != sortOptions.last {
                                Divider()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .background(Constants.Colors.blackBlue)
            .frame(width: 171)
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke( LinearGradient(
                        gradient: Constants.Colors.gradient,
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        ), lineWidth: 1)
            )
        }
    }
}

func reset() {}
// Custom button for filter options
struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let type: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            if type == "Sport" {
                Text(title)
                    .font(.system(size: 13.29))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundColor(
                        title == "Basketball" ? (isSelected ? .black : .white) : (.gray)
                    )
                    .background(
                        title == "Basketball" ?
                        (isSelected ? Constants.Colors.lightBlue  : Color.blue.opacity(0.7)) : Color.black
                        )
                    .clipShape(Capsule())
                
            } else {
                Text(title)
                    .font(.system(size: 13.29))
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .foregroundColor(
                        isSelected ? .black : .white
                    )
                    .background(isSelected ? Constants.Colors.lightBlue : Color.blue.opacity(0.7))
                    .clipShape(Capsule())
            }
        }
    }
}

// Custom flow layout to arrange buttons
struct FlowLayout: Layout {
    let spacing: CGFloat

    init(spacing: CGFloat = 10) {
        self.spacing = spacing
    }

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        let width = proposal.width ?? 0
        var height: CGFloat = 0
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }

        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var maxHeight: CGFloat = 0

        for (index, size) in sizes.enumerated() {
            if currentX + size.width > width {
                // Move to next row
                currentX = 0
                currentY += maxHeight + spacing
                maxHeight = 0
            }

            // Position the view
            maxHeight = max(maxHeight, size.height)
            currentX += size.width + spacing
        }

        return CGSize(width: width, height: currentY + maxHeight)
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        let sizes = subviews.map { $0.sizeThatFits(.unspecified) }

        var currentX = bounds.minX
        var currentY = bounds.minY
        var maxHeight: CGFloat = 0

        for (index, subview) in subviews.enumerated() {
            let size = sizes[index]

            if currentX + size.width > bounds.maxX {
                // Move to next row
                currentX = bounds.minX
                currentY += maxHeight + spacing
                maxHeight = 0
            }

            subview.place(
                at: CGPoint(x: currentX, y: currentY),
                proposal: ProposedViewSize(size)
            )

            maxHeight = max(maxHeight, size.height)
            currentX += size.width + spacing
        }
    }
}

struct SortOption: Identifiable, Equatable {
    let id = UUID()
    let title: String
}

struct RangeSlider: View {
    @Binding var lowValue: Double
    @Binding var highValue: Double
    @Binding var alteredState: Bool
    let range: ClosedRange<Double>
    let step: Double = 50 // Define the step value

    // Track width constant
    private let trackWidth: CGFloat = 344
    private let handleDiameter: CGFloat = 14

    // Calculate position from value
    private func position(for value: Double) -> CGFloat {
        let percentage = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return CGFloat(percentage) * (trackWidth - handleDiameter)
    }

    // Calculate value from position
    private func value(for position: CGFloat) -> Double {
        let percentage = Double(position) / Double(trackWidth - handleDiameter)
        let value = percentage * (range.upperBound - range.lowerBound) + range.lowerBound
        return round(value / step) * step
    }

    var body: some View {
        GeometryReader { _ in
            VStack(alignment: .leading) {

                    if lowValue == 0 && highValue == 10000 {
                        Text("Any")
                            .font(.custom("Rubik-Regular", size: 20))
                            .foregroundStyle(.white)
                            .padding(.trailing, 52)

                    } else if lowValue == 0 {
                        Text("Up to $\(Int(highValue))")
                            .font(.custom("Rubik-Regular", size: 20))
                            .foregroundStyle(.white)

                    } else if highValue == 10000 {
                        Text("$\(Int(lowValue)) +")
                            .font(.custom("Rubik-Regular", size: 20))
                            .foregroundStyle(.white)
                            .padding(.trailing, lowValue > 99 ? 24 : 36)

                    } else {
                        Text("$\(Int(lowValue)) to $\(Int(highValue))")
                            .font(.custom("Rubik-Regular", size: 20))
                            .foregroundStyle(.white)
                    }

                ZStack(alignment: .leading) {
                    // Track
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Constants.Colors.gradient,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: trackWidth, height: 7.6)
                        .cornerRadius(4)

                    // Low handle
                    Circle()
                        .fill(Color.white)
                        .frame(width: handleDiameter, height: handleDiameter)
                        .shadow(radius: 4)
                        .position(x: position(for: lowValue) + handleDiameter/2)
                        .offset(y: 7)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let newPosition = min(max(0, value.location.x - handleDiameter/2), position(for: highValue) - handleDiameter)
                                    let newValue = self.value(for: newPosition)
                                    // Ensure minimum distance between handles
                                    if newValue <= highValue - step {
                                        lowValue = newValue
                                    }
                                    alteredState = true
                                }
                        )

                    // High handle
                    Circle()
                        .fill(Color.white)
                        .frame(width: handleDiameter, height: handleDiameter)
                        .shadow(radius: 4)
                        .position(x: position(for: highValue) + handleDiameter/2)
                        .offset(y: 7)
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let newPosition = min(max(position(for: lowValue) + handleDiameter, value.location.x - handleDiameter/2), trackWidth - handleDiameter)
                                    let newValue = self.value(for: newPosition)
                                    // Ensure minimum distance between handles
                                    if newValue >= lowValue + step {
                                        highValue = newValue
                                    }
                                    alteredState = true

                                }
                        )
                }
            }

            HStack {
                Text("$0")
                    .foregroundStyle(Constants.Colors.white)

                Spacer()

                Text("$10000")
                    .foregroundStyle(Constants.Colors.white)

            }
            .frame(width: 344)
            .offset(y: 48)
        }
        .frame(height: 44)
    }
}


