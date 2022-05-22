//
//  DetailsPresenter.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import Foundation

extension DetailsPresenter {
    fileprivate enum Constants {
        static let slotCountTitle: String = "Slot count: "
    }
}

protocol DetailsPresenterInterface: AnyObject {
    func viewDidLoad()
    func setTitle()
    func setAddress()
    func setNumberOfPoints()
    func navigateButtonTapped()
    func getLongitude() -> String
    func getLatitude() -> String
}

final class DetailsPresenter: DetailsPresenterInterface {

    unowned var view: DetailsViewControllerInterface!
    let router: DetailsRouterInterface!
    let interactor: DetailsInteractorInterface!
    let station: Station

    init(interactor: DetailsInteractorInterface,
         router: DetailsRouterInterface,
         view: DetailsViewControllerInterface,
         station: Station) {

        self.view = view
        self.interactor = interactor
        self.router = router
        self.station = station
    }

    func viewDidLoad() {
        setTitle()
        setAddress()
        setNumberOfPoints()
    }
}

extension DetailsPresenter {
    func setTitle() {
        view.setTitleLabel(station.addressInfo?.title)
    }

    func setAddress() {
        view.setAddressLabel("\(station.addressInfo?.addressLine1 ?? "")" + " \(station.addressInfo?.addressLine2 ?? "")")
    }

    func setNumberOfPoints() {
        if let numberOfPoints = station.numberOfPoints {
            view.setChargingLabel("\(Constants.slotCountTitle) \(numberOfPoints)")
        }
    }

    func navigateButtonTapped() {
        view.openGoogleMapsNavigation()
    }

    func getLongitude() -> String {
        "\(station.addressInfo?.longitude ?? .zero)"
    }

    func getLatitude() -> String {
        "\(station.addressInfo?.latitude ?? .zero)"
    }
}

extension DetailsPresenter: DetailsInteractorOutputInterface {}
