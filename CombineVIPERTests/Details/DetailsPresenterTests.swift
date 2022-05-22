//
//  DetailsPresenterTests.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

import XCTest
@testable import CombineVIPER

class DetailsPresenterTests: XCTestCase {
    var presenter: DetailsPresenter!
    var view: MockDetailsViewController!
    var interactor: MockDetailsInteractor!
    var router: MockDetailsRouter!
    var station: Station!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        station = Station.response.first
        presenter = .init(interactor: interactor,
                          router: router,
                          view: view,
                          station: station)
    }

    func test_titleLabel() {
        XCTAssertFalse(view.invokedSetTitleLabel)
        XCTAssertEqual(view.invokedSetTitleLabelCount, .zero)
        XCTAssertEqual(view.invokedSetTitleLabelParameters?.text, nil)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedSetTitleLabel)
        XCTAssertEqual(view.invokedSetTitleLabelCount, 1)
        XCTAssertEqual(view.invokedSetTitleLabelParameters?.text, Station.response.first?.addressInfo?.title)
    }

    func test_addressLabel() {
        XCTAssertFalse(view.invokedSetAddressLabel)
        XCTAssertEqual(view.invokedSetAddressLabelCount, .zero)
        XCTAssertEqual(view.invokedSetAddressLabelParameters?.text, nil)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedSetAddressLabel)
        XCTAssertEqual(view.invokedSetAddressLabelCount, 1)
        XCTAssertEqual(view.invokedSetAddressLabelParameters?.text, "\(Station.response.first?.addressInfo?.addressLine1 ?? "")" + " \(Station.response.first?.addressInfo?.addressLine2 ?? "")")
    }

    func test_chargingLabel() {
        XCTAssertFalse(view.invokedSetChargingLabel)
        XCTAssertEqual(view.invokedSetChargingLabelCount, .zero)
        XCTAssertEqual(view.invokedSetChargingLabelParameters?.text, nil)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedSetChargingLabel)
        XCTAssertEqual(view.invokedSetChargingLabelCount, 1)
        XCTAssertEqual(view.invokedSetChargingLabelParameters?.text, "Slot count:  \(Station.response.first?.numberOfPoints! ?? .zero)")
    }

    func test_navigateToStationButton() {
        XCTAssertFalse(view.invokedOpenGoogleMapsNavigation)
        XCTAssertEqual(view.invokedOpenGoogleMapsNavigationCount, .zero)
        presenter.navigateButtonTapped()
        XCTAssertTrue(view.invokedOpenGoogleMapsNavigation)
        XCTAssertEqual(view.invokedOpenGoogleMapsNavigationCount, 1)

    }
}
