//
//  GetStationsEndpoint.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 21.05.2022.
//

import Foundation
import CoreAPI

enum GetStationsEndpoint: Endpoint {
    case stations(_ values: GetStationsRequestModel)

    var baseUrl: String { "https://api.openchargemap.io/" }

    var path: String {
        switch self {
        case .stations:
            return "v3/poi"
        }
    }

    var parameters: [String : Any] {
        switch self {
        case .stations(let values):
            return ["longitude": values.longitude,
                    "latitude": values.latitude,
                    "distance": values.distance]
        }
    }

    var method: HTTPMethod {
        switch self {
        case .stations:
            return .get
        }
    }

    var headers: [String : String] {
        ["X-API-Key" : "1e2cb9c6-a0e9-4a68-bc09-f3c97a6bd8e4"]
    }
}
