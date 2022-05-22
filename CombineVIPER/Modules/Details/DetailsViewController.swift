//
//  DetailsViewController.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import UIKit
import SwiftUI

extension DetailsViewController {
    fileprivate enum Constants {
        static let googleMapsBaseURL: String = "https://www.google.com/maps/dir/?api=1&travelmode=driving&layer=traffic&destination="
    }
}


protocol DetailsViewControllerInterface: AnyObject {
    func setTitleLabel(_ text: String?)
    func setAddressLabel(_ text: String?)
    func setChargingLabel(_ text: String?)
    func openGoogleMapsNavigation()
}

final class DetailsViewController: BaseViewController {
    @IBOutlet private weak var titleLabel: BaseLabel!
    @IBOutlet private weak var addressLabel: BaseLabel!
    @IBOutlet private weak var chargingPointsLabel: BaseLabel!

    var presenter: DetailsPresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }

    @IBAction func navigateToStationButtonTapped() {
        presenter.navigateButtonTapped()
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

    func openGoogleMapsNavigation() {
        if let url = URL(string: "\(Constants.googleMapsBaseURL)\(presenter.getLatitude()),\(presenter.getLongitude())") {
            UIApplication.shared.open(url)
        }
    }
}
