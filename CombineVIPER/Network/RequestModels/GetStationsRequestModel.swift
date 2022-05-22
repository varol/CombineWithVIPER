//
//  GetStationsRequestModel.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import Foundation

struct GetStationsRequestModel {
    let latitude: Double
    let longitude: Double
    let distance: Double

    internal init(latitude: Double = 52.526,
                  longitude: Double = 13.415,
                  distance: Double = 5) {
        
        self.latitude = latitude
        self.longitude = longitude
        self.distance = distance
    }
}
