//
//  HomeInteractor.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Combine
import CoreAPI
import Foundation

protocol HomeInteractorInterface: AnyObject {
    func fetchStations(values: GetStationsRequestModel) -> AnyPublisher<[Station], Error>
}

final class HomeInteractor {
    private let apiService: APIServiceProtocol

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
}

extension HomeInteractor: HomeInteractorInterface {
    func fetchStations(values: GetStationsRequestModel) -> AnyPublisher<[Station], Error> {
        return Future<[Station], Error> { [weak self] promise in
            guard let self = self else { return }
            self.apiService.fetchStations(values: values) { result in
                switch result {
                case .success(let response):
                    promise(.success(response))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
