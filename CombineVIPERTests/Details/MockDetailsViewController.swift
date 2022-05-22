//
//  MockDetailsViewController.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

@testable import CombineVIPER
import UIKit

final class MockDetailsViewController: DetailsViewControllerInterface {

    var invokedSetTitleLabel = false
    var invokedSetTitleLabelCount = 0
    var invokedSetTitleLabelParameters: (text: String?, Void)?
    var invokedSetTitleLabelParametersList = [(text: String?, Void)]()

    func setTitleLabel(_ text: String?) {
        invokedSetTitleLabel = true
        invokedSetTitleLabelCount += 1
        invokedSetTitleLabelParameters = (text, ())
        invokedSetTitleLabelParametersList.append((text, ()))
    }

    var invokedSetAddressLabel = false
    var invokedSetAddressLabelCount = 0
    var invokedSetAddressLabelParameters: (text: String?, Void)?
    var invokedSetAddressLabelParametersList = [(text: String?, Void)]()

    func setAddressLabel(_ text: String?) {
        invokedSetAddressLabel = true
        invokedSetAddressLabelCount += 1
        invokedSetAddressLabelParameters = (text, ())
        invokedSetAddressLabelParametersList.append((text, ()))
    }

    var invokedSetChargingLabel = false
    var invokedSetChargingLabelCount = 0
    var invokedSetChargingLabelParameters: (text: String?, Void)?
    var invokedSetChargingLabelParametersList = [(text: String?, Void)]()

    func setChargingLabel(_ text: String?) {
        invokedSetChargingLabel = true
        invokedSetChargingLabelCount += 1
        invokedSetChargingLabelParameters = (text, ())
        invokedSetChargingLabelParametersList.append((text, ()))
    }

    var invokedOpenGoogleMapsNavigation = false
    var invokedOpenGoogleMapsNavigationCount = 0

    func openGoogleMapsNavigation() {
        invokedOpenGoogleMapsNavigation = true
        invokedOpenGoogleMapsNavigationCount += 1
    }
}
