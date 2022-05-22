//
//  MockHomeViewController.swift
//  CombineVIPERTests
//
//  Created by Varol Aksoy on 22.05.2022.
//

@testable import CombineVIPER
import UIKit

final class MockHomeViewController: HomeViewControllerInterface {

    var invokedPrepareMapView = false
    var invokedPrepareMapViewCount = 0
    var invokedPrepareMapViewParameters: (longitude: Double, latitude: Double, delta: Double)?
    var invokedPrepareMapViewParametersList = [(longitude: Double, latitude: Double, delta: Double)]()

    func prepareMapView(longitude: Double, latitude: Double, delta: Double) {
        invokedPrepareMapView = true
        invokedPrepareMapViewCount += 1
        invokedPrepareMapViewParameters = (longitude, latitude, delta)
        invokedPrepareMapViewParametersList.append((longitude, latitude, delta))
    }

    var invokedAddAnnotations = false
    var invokedAddAnnotationsCount = 0
    var invokedAddAnnotationsParameters: (station: Station, Void)?
    var invokedAddAnnotationsParametersList = [(station: Station, Void)]()

    func addAnnotations(_ station: Station) {
        invokedAddAnnotations = true
        invokedAddAnnotationsCount += 1
        invokedAddAnnotationsParameters = (station, ())
        invokedAddAnnotationsParametersList.append((station, ()))
    }

    var invokedRemoveAnnotations = false
    var invokedRemoveAnnotationsCount = 0

    func removeAnnotations() {
        invokedRemoveAnnotations = true
        invokedRemoveAnnotationsCount += 1
    }

    var invokedShowLoadingView = false
    var invokedShowLoadingViewCount = 0

    func showLoadingView() {
        invokedShowLoadingView = true
        invokedShowLoadingViewCount += 1
    }

    var invokedHideLoadingView = false
    var invokedHideLoadingViewCount = 0

    func hideLoadingView() {
        invokedHideLoadingView = true
        invokedHideLoadingViewCount += 1
    }

    var invokedGetMapViewLongitude = false
    var invokedGetMapViewLongitudeCount = 0
    var stubbedGetMapViewLongitudeResult: Double! = 0

    func getMapViewLongitude() -> Double {
        invokedGetMapViewLongitude = true
        invokedGetMapViewLongitudeCount += 1
        return stubbedGetMapViewLongitudeResult
    }

    var invokedGetMapViewLatitude = false
    var invokedGetMapViewLatitudeCount = 0
    var stubbedGetMapViewLatitudeResult: Double! = 0

    func getMapViewLatitude() -> Double {
        invokedGetMapViewLatitude = true
        invokedGetMapViewLatitudeCount += 1
        return stubbedGetMapViewLatitudeResult
    }

    var invokedTapticFeedback = false
    var invokedTapticFeedbackCount = 0

    func tapticFeedback() {
        invokedTapticFeedback = true
        invokedTapticFeedbackCount += 1
    }

    var invokedDidSelectStation = false
    var invokedDidSelectStationCount = 0
    var invokedDidSelectStationParameters: (station: Station, Void)?
    var invokedDidSelectStationParametersList = [(station: Station, Void)]()

    func didSelectStation(_ station: Station) {
        invokedDidSelectStation = true
        invokedDidSelectStationCount += 1
        invokedDidSelectStationParameters = (station, ())
        invokedDidSelectStationParametersList.append((station, ()))
    }
}
