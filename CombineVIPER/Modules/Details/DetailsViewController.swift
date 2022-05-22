//
//  DetailsViewController.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import UIKit
import SwiftUI

protocol DetailsViewControllerInterface: AnyObject {
    func setTitleLabel(_ text: String?)
    func setAddressLabel(_ text: String?)
    func setChargingLabel(_ text: String?)
}

class DetailsViewController: BaseViewController {
    @IBOutlet private weak var titleLabel: BaseLabel!
    @IBOutlet private weak var addressLabel: BaseLabel!
    @IBOutlet private weak var chargingPointsLabel: BaseLabel!

    var presenter: DetailsPresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension DetailsViewController: DetailsViewControllerInterface {
    func setTitleLabel(_ text: String?) {
        guard let text = text else { return }
        titleLabel.text = text
    }

    func setAddressLabel(_ text: String?) {
        guard let text = text else { return }
        addressLabel.text = text
    }

    func setChargingLabel(_ text: String?) {
        guard let text = text else { return }
        chargingPointsLabel.text = text
    }
}
