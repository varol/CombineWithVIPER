//
//  HomePresenter.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Combine
import Foundation
import CoreLocation

extension HomePresenter {
    fileprivate enum Constants {
        static let initialLongitude: Double = 13.415
        static let initialLatitude: Double = 52.526
        static let initialDistance: Double = 5
        static let initialMapDeltaValue: Double = 0.01
        static let timerInterval: Double = 30.0
    }
}

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidDisappear()
    func startTimer(timerInterval: Double)
    func timerInvalidate()

    var input: HomePresenterInput? { get }
    var output: HomePresenterOutput? { get }
}

protocol HomePresenterInput: AnyObject {
    var didSelectStationTrigger: PassthroughSubject<Station, Never> { get }
}

protocol HomePresenterOutput: AnyObject {
    var stations: CurrentValueSubject<[Station], Error> { get }
}

final class HomePresenter: HomePresenterInterface, HomePresenterInput, HomePresenterOutput {
    unowned private var view: HomeViewControllerInterface!
    private let router: HomeRouterInterface!
    private let interactor: HomeInteractorInterface!

    init(interactor: HomeInteractorInterface,
         router: HomeRouterInterface,
         view: HomeViewControllerInterface) {

        self.interactor = interactor
        self.router = router
        self.view = view
    }

    // MARK: - Inputs
    var didSelectStationTrigger = PassthroughSubject<Station, Never>()

    // MARK: - Outputs
    var stations = CurrentValueSubject<[Station], Error>([])

    // MARK: - Variables
    weak var input: HomePresenterInput? { return self }
    weak var output: HomePresenterOutput? { return self }
    private var cancellables = [AnyCancellable]()
    private var timer: Timer?

    func viewDidLoad() {
        prepareMapView()

        fetchStations(latitude: Constants.initialLatitude,
                      longitude: Constants.initialLongitude)

        handleAnnotationTapped()
    }
    
    func viewWillAppear() {
        startTimer(timerInterval: Constants.timerInterval)
    }

    func viewDidDisappear() {
        timerInvalidate()
    }

    func startTimer(timerInterval: Double) {
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: timerInterval,
                                              target: self,
                                              selector: #selector(self.refreshMapData),
                                              userInfo: nil,
                                              repeats: true)
        }
    }

    @objc func refreshMapData() {
        fetchStations(latitude: view.getMapViewLatitude(),
                      longitude: view.getMapViewLongitude())
    }

    func timerInvalidate() {
        timer?.invalidate()
    }
}

private extension HomePresenter {
    private func fetchStations(latitude: Double, longitude: Double) {
        view.showLoadingView()
        interactor.fetchStations(values: GetStationsRequestModel(latitude: latitude,
                                                                 longitude: longitude,
                                                                 distance: Constants.initialDistance))
        .sink(receiveCompletion: { [weak self] completion in
            guard let self = self else { return }
            if case .failure(let error) = completion {
                self.stations.send(completion: .failure(error))
            }
        }, receiveValue: { [weak self] values in
            guard let self = self else { return }
            self.stations.send(values)
            self.view.removeAnnotations()
            values.forEach { station in
                self.addAnnotation(station)
            }
            self.view.tapticFeedback()
            self.view.hideLoadingView()
        })
        .store(in: &cancellables)
    }

    func prepareMapView() {
        view.prepareMapView(longitude: Constants.initialLongitude,
                            latitude: Constants.initialLatitude,
                            delta: Constants.initialMapDeltaValue)
    }

    func addAnnotation(_ station: Station) {
        view.addAnnotations(station)
    }

    private func handleAnnotationTapped() {
        didSelectStationTrigger
            .sink(receiveValue: { [weak self] station in
                guard let self = self else { return }
                self.view.tapticFeedback()
                self.router.navigate(.details(station: station))
            })
            .store(in: &cancellables)
    }
}
