//
//  UIWheelViewController.swift
//  All In
//
//  Created by Peter Bidoshi on 4/23/24.
//

import SnapKit
import UIKit

class UIWheelViewController: UIViewController {

    // MARK: - Properties (View)

    private var scrollView = UIScrollView()
    private var stackView = UIStackView()

    // MARK: - Init

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        setUpSelf()
    }

    // MARK: - Setup

    private func addCard() {
        let card = WheelItemView()
        let background = UIView()

        background.addSubview(card)
        stackView.addArrangedSubview(background)

        background.snp.makeConstraints { make in
            make.width.equalTo(181 + 16)
            make.height.equalTo(222)
        }

        card.snp.makeConstraints { make in
            make.width.equalTo(181)
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }

    private func setUpSelf() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        setUpScrollView()
        setUpConstraints()
    }

    private func setUpScrollView() {
        scrollView.alwaysBounceHorizontal = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.clipsToBounds = false
        scrollView.isUserInteractionEnabled = false
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.distribution = .fill
        stackView.alignment = .fill

        for _ in 0..<20 {
            addCard()
        }

        // run it in 0.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.animate(withDuration: 3) {
                self.scrollView.contentOffset = CGPoint(x: self.scrollView.contentSize.width - self.scrollView.frame.width, y: 0)
            }
        }
    }

    private func setUpConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.width.equalTo(181 + 16)
            make.center.equalToSuperview()
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
