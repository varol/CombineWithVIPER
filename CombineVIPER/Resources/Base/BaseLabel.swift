//
//  BaseLabel.swift
//  BaseVIPER
//
//  Created by Varol Aksoy
//

import UIKit

class BaseLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureFont()
    }

    func configureFont() {
        self.textColor = .darkGray
    }
}
