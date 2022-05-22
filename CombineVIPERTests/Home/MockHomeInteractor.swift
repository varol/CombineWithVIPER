//
//  MockHomeInteractor.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

@testable import CombineVIPER
import Foundation
import Combine

final class MockHomeInteractor: HomeInteractorInterface {

    var invokedFetchStations = false
    var invokedFetchStationsCount = 0
    var invokedFetchStationsParameters: (values: GetStationsRequestModel, Void)?
    var invokedFetchStationsParametersList = [(values: GetStationsRequestModel, Void)]()
    var stubbedFetchStationsResult: AnyPublisher<[Station], Error>!

    func fetchStations(values: GetStationsRequestModel) -> AnyPublisher<[Station], Error> {
        invokedFetchStations = true
        invokedFetchStationsCount += 1
        invokedFetchStationsParameters = (values, ())
        invokedFetchStationsParametersList.append((values, ()))

        return Future<[Station], Error> { promise in
            promise(.success(Station.response))
        }
        .eraseToAnyPublisher()
    }

    func fetchStationsWithResponse(values: GetStationsRequestModel, response: [Station]) -> AnyPublisher<[Station], Error> {
        invokedFetchStations = true
        invokedFetchStationsCount += 1
        invokedFetchStationsParameters = (values, ())
        invokedFetchStationsParametersList.append((values, ()))

        return Future<[Station], Error> { promise in
            promise(.success(response))
        }
        .eraseToAnyPublisher()
    }

}
