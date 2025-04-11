//
//  FilterView.swift
//  All In
//
//  Created by Charles Liggins on 4/10/25.
//

import SwiftUI

struct FilterView: View {

    @State var presentPopup = false
    @State private var priceLowValue: Double = 0
    @State private var priceHighValue: Double = 10000
    @State private var payoutLowValue: Double = 0
    @State private var payoutHighValue: Double = 10000
    @State private var showSale = false
    @State private var sportFilters = Set<String>()
    @State private var rarityFilters = Set<String>()
    @State private var selectedSort: SortOption?
    @State private var selectedSport: String?
     @State private var selectedRarity: String?

    private var sports: [String] = ["Basketball", "Hockey", "Baseball", "Swim", "Volleyball", "Track & Field", "Tennis"]
    private var rarities: [String] = ["Common", "Epic", "Rare", "Legendary"]

    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
    ]

    let gridItem = GridItem(.adaptive(minimum: 100), spacing: 10)

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
                        presentPopup.toggle()
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
                            .foregroundStyle(Constants.Colors.white)                        .padding(.leading, 28)
                        .padding(.bottom, 24)
                    }

                    // SLIDER
                    RangeSlider(lowValue: $priceLowValue, highValue: $priceHighValue, range: 0...10000)
                        .padding(.leading, 28)
                        .offset(y: -20)
                        .padding(.bottom, 20)

                        Text("Payout Range")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Constants.Colors.white)
                            .foregroundStyle(.gray)
                            .padding(.leading, 28)
                            .padding(.bottom, 24)

                    RangeSlider(lowValue: $payoutLowValue, highValue: $payoutHighValue, range: 0...10000)
                        .padding(.leading, 28)
                        .offset(y: -20)

                }

                gradientDivider

                VStack(alignment: .leading) {
                    Text("Sport")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(Constants.Colors.white)
                        .padding(.bottom, 8)
                    FlowLayout(spacing: 10) {
                                      ForEach(sports, id: \.self) { sport in
                                          FilterButton(
                                              title: sport,
                                              isSelected: selectedSport == sport,
                                              action: {
                                                  selectedSport = selectedSport == sport ? nil : sport
                                              }
                                          )
                                      }
                    }
                }
                .padding(.leading, 28)

                gradientDivider

                VStack(alignment: .leading) {
                    Text("Rarity")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.bottom, 8)

                    HStack {
                        ForEach(rarities, id: \.self) { rarity in
                            FilterButton(
                                title: rarity,
                                isSelected: selectedRarity == rarity,
                                action: {
                                    selectedRarity = selectedRarity == rarity ? nil : rarity
                                }
                            )
                        }
                    }
                }.padding(.leading, -20)

                HStack {
                    Button {
                        sportFilters.removeAll()
                        rarityFilters.removeAll()
                    } label: {
                        Text("Reset")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                            .padding(.leading, 40)
                            .foregroundStyle(.black)
                    }

                    Spacer()

                    Button {

                    } label: {
                            Text("Apply filters")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundStyle(.white.opacity(0.4))
                                .padding(.horizontal, 14)
                                .padding(.vertical, 8)
                                .background(sportFilters.isEmpty && rarityFilters.isEmpty ? .gray.opacity(0.2) : .purple)
                                .cornerRadius(20)

                    }
                    .padding(.trailing, 40)
                }
                .padding(.top, 32)
            }

            if presentPopup {
                SortByView(selectedSort: $selectedSort)
                    .offset(x: 88, y: -142)
                    .onTapGesture {
                        presentPopup.toggle()
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

        let sortOptions = [
            SortOption(title: "Any"),
            SortOption(title: "Newly listed"),
            SortOption(title: "Price: High to Low"),
            SortOption(title: "Price: Low to High")
        ]

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(sortOptions) { option in
                    Button(action: {
                        selectedSort = option
                    }) {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(option.title)
                                .font(.system(size: 17, weight: selectedSort == option ? .bold : .regular))
                                .foregroundColor(.black)
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
            .background(Color.white)
            .frame(width: 171)
            .overlay(
                RoundedRectangle(cornerRadius: 13)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            }
    }
}

func reset() {}
// Custom button for filter options
struct FilterButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 13.29))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .foregroundColor(isSelected ? .white : .white)
                .background(isSelected ? Color.blue : Color.blue.opacity(0.7))
                .clipShape(Capsule())
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

#Preview {
    FilterView()
}
