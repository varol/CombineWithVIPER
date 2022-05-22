//
//  StationResponse.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 20.05.2022.
//

import CoreLocation
import Foundation

// MARK: - Station
struct Station: Codable {
    let id: Int?
    let addressInfo: AddressInfo?
    let numberOfPoints: Int?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case addressInfo = "AddressInfo"
        case numberOfPoints = "NumberOfPoints"
    }
}

// MARK: - AddressInfo
struct AddressInfo: Codable {
    let id: Int?
    let title, addressLine1: String?
    let addressLine2: String?
    let town: String?
    let stateOrProvince: String?
    let postcode: String?
    let countryID: Int?
    let latitude, longitude: Double?
    let contactTelephone1, contactTelephone2, contactEmail, accessComments: String?
    let relatedURL: String?
    let distance: Double?
    let distanceUnit: Int?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case town = "Town"
        case stateOrProvince = "StateOrProvince"
        case postcode = "Postcode"
        case countryID = "CountryID"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case contactTelephone1 = "ContactTelephone1"
        case contactTelephone2 = "ContactTelephone2"
        case contactEmail = "ContactEmail"
        case accessComments = "AccessComments"
        case relatedURL = "RelatedURL"
        case distance = "Distance"
        case distanceUnit = "DistanceUnit"
    }

    public var coordinates: CLLocationCoordinate2D {
      return CLLocationCoordinate2DMake(latitude ?? 0, longitude ?? 0)
    }
}
