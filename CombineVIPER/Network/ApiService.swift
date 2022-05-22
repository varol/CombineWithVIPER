//
//  ApiService.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import CoreAPI
import MapKit.MKGeometry

typealias StationsResult = Result<[Station], APIClientError>

protocol APIServiceProtocol: AnyObject {
    func fetchStations(values: GetStationsRequestModel,
                       completion: @escaping ((StationsResult) -> Void))
}

class APIService: APIServiceProtocol {
    let networkManager = NetworkManager<GetStationsEndpoint>()

    func fetchStations(values: GetStationsRequestModel,
                       completion: @escaping ((StationsResult) -> Void)) {
        networkManager.request(endpoint: .stations(values),
                               type: [Station].self) { result in
            completion(result)
        }
    }
}
