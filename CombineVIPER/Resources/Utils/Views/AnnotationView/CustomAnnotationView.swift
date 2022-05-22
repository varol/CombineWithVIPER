//
//  CustomAnnotationView.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import MapKit

final class CustomAnnotationView: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    let station: Station?

    public init (_ station: Station) {
        self.coordinate = CLLocationCoordinate2D(latitude: station.addressInfo?.latitude ?? 0,
                                                 longitude: station.addressInfo?.longitude ?? 0)
        self.title = station.addressInfo?.title
        self.subtitle = station.addressInfo?.addressLine1
        self.station = station
    }
}
