//
//  WheelItemUIView.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SwiftUI
import UIKit

class WheelItemUIView: UIView {

    // MARK: - Properties (View)

    private var playerImageView = UIImageView()
    private var playerNameLabel = UILabel()
    private var rarityLabel = UILabel()
    private var statView = UIView()
    private var statLabel = UILabel()

    // MARK: - Init

    init() {
        super.init(frame: .zero)

        setUpSelf()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(rarity: Rarity) {

    }

    func configure(player: Player) {

    }

    // MARK: - Setup

    private func setUpSelf() {
        backgroundColor = .white
        layer.cornerRadius = 16
        layer.shadowColor = Constants.Colors.grey02.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 0)

        addSubview(playerImageView)
        addSubview(playerNameLabel)
        setUpPlayerView()

        addSubview(rarityLabel)
        setUpRarityLabel()

        addSubview(statView)
        statView.addSubview(statLabel)
        setUpStat()

        setUpConstraints()
    }

    private func setUpPlayerView() {
//        NetworkManager.shared.getRandomPlayer { [weak self] player in
//            guard let self else { return }
//
//            playerNameLabel.text = "\(player.firstName[player.firstName.startIndex]). \(player.lastName)"
//            playerNameLabel.font = .systemFont(ofSize: 14, weight: .bold)
//
//            NetworkManager.shared.getPlayerImage(id: player.id) { [weak self] image in
//                guard let self else { return }
//                playerImageView.image = image
//            }
//        }
    }

    private func setUpRarityLabel() {
        let randomRarity = Rarity.getRandom()
        rarityLabel.text = randomRarity.rawValue
        rarityLabel.font = .systemFont(ofSize: 16, weight: .bold)
        rarityLabel.textColor = UIColor(cgColor: randomRarity.getColor().cgColor ?? CGColor(gray: 1.0, alpha: 1.0))
    }

    private func setUpStat() {
        statView.backgroundColor = UIColor(cgColor: Constants.Colors.grey01.cgColor ?? CGColor(gray: 1.0, alpha: 1.0))
        statView.layer.cornerRadius = 16
        statLabel.text = "???"
        statLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }

    private func setUpConstraints() {
        playerImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.size.equalTo(82)
        }

        playerNameLabel.snp.makeConstraints { make in
            make.top.equalTo(playerImageView.snp.bottom)
            make.centerX.equalToSuperview()
        }

        rarityLabel.snp.makeConstraints { make in
            make.top.equalTo(playerNameLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }

        statView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }

        statLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
