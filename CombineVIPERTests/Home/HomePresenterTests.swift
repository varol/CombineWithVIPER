//
//  HomePresenterTests.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

import XCTest
@testable import CombineVIPER

class HomePresenterTests: XCTestCase {
    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    var router: MockHomeRouter!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(interactor: interactor, router: router, view: view)
    }

    func test_viewDidLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(view.invokedPrepareMapView)
        XCTAssertEqual(view.invokedPrepareMapViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedPrepareMapView)
        XCTAssertEqual(view.invokedPrepareMapViewCount, 1)
    }

    func test_showLoading() {
        XCTAssertFalse(view.invokedShowLoadingView)
        XCTAssertEqual(view.invokedShowLoadingViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedShowLoadingView)
        XCTAssertEqual(view.invokedShowLoadingViewCount, 1)
    }

    func test_hideLoading() {
        XCTAssertFalse(view.invokedHideLoadingView)
        XCTAssertEqual(view.invokedHideLoadingViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedHideLoadingView)
        XCTAssertEqual(view.invokedHideLoadingViewCount, 1)
    }

    func test_prepareMapView() {
        XCTAssertFalse(view.invokedPrepareMapView)
        XCTAssertEqual(view.invokedPrepareMapViewCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedPrepareMapView)
        XCTAssertEqual(view.invokedPrepareMapViewCount, 1)
    }

    func test_addAnnotations() {
        XCTAssertFalse(view.invokedAddAnnotations)
        XCTAssertEqual(view.invokedAddAnnotationsCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedAddAnnotations)
        XCTAssertEqual(view.invokedAddAnnotationsCount, 100)
    }

    func test_removeAnnonations() {
        XCTAssertFalse(view.invokedRemoveAnnotations)
        XCTAssertEqual(view.invokedRemoveAnnotationsCount, .zero)
        presenter.viewDidLoad()
        XCTAssertTrue(view.invokedRemoveAnnotations)
        XCTAssertEqual(view.invokedRemoveAnnotationsCount, 1)
    }

    func test_Timer() {
        XCTAssertEqual(presenter.getTimerInterval(), nil)
        presenter.viewWillAppear()
        wait {
            XCTAssertEqual(self.presenter.getTimerInterval(), 30.0)
        }
    }

    func test_navigateToDetails() {
        XCTAssertEqual(router.invokedNavigateCount, .zero)
        presenter.viewDidLoad()
        presenter.input?.didSelectStationTrigger.send(Station.response.first!)
        XCTAssertEqual(self.router.invokedNavigateCount, 1)
    }
}

// MARK: - Extensions

extension Station {
    static var response: [Station] {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "StationsResponse", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let homeResponse = try! JSONDecoder().decode([Station].self, from: data)
        return homeResponse
    }

    static var emptyResponse: Station? {
        nil
    }
}

extension XCTestCase {
    func wait(interval: TimeInterval = 0.1 , completion: @escaping (() -> Void)) {
        let exp = expectation(description: "")
        DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
            completion()
            exp.fulfill()
        }
        waitForExpectations(timeout: interval + 0.1)
    }
}

