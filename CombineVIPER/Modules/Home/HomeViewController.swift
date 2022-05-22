//
//  HomeViewController.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Combine
import MapKit
import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func prepareMapView(longitude: Double, latitude: Double, delta: Double)
    func addAnnotations(_ station: Station)
    func removeAnnotations()
    func showLoadingView()
    func hideLoadingView()
    func getMapViewLongitude() -> Double
    func getMapViewLatitude() -> Double
    func tapticFeedback()
}

final class HomeViewController: BaseViewController {
    @IBOutlet private weak var mapView: MKMapView!

    var presenter: HomePresenterInterface!
    private var cancellables = [AnyCancellable]()

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        presenter.viewDidDisappear()
    }
}

extension HomeViewController: HomeViewControllerInterface {
    fileprivate func setMapRegion(_ latitude: Double, _ longitude: Double, _ delta: Double) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                                       longitude: location.coordinate.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: delta,
                                                               longitudeDelta: delta))
        mapView.setRegion(region, animated: true)
    }

    func prepareMapView(longitude: Double, latitude: Double, delta: Double) {
        mapView.delegate = self
        setMapRegion(latitude, longitude, delta)
    }

    func addAnnotations(_ station: Station) {
        DispatchQueue.main.async {
            let annotationView = CustomAnnotationView(station)
            self.mapView.addAnnotation(annotationView)
        }
    }

    func showLoadingView() {
        showLoading()
    }

    func hideLoadingView() {
        hideLoading()
    }

    func getMapViewLatitude() -> Double {
        mapView.centerCoordinate.latitude
    }

    func getMapViewLongitude() -> Double {
        mapView.centerCoordinate.longitude
    }

    func removeAnnotations() {
        mapView.removeAnnotations(mapView.annotations)
    }

    func tapticFeedback() {
        let tapticFeedback = UINotificationFeedbackGenerator()
        tapticFeedback.notificationOccurred(.success)
    }
}

extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotationView = view.annotation as? CustomAnnotationView else { return }
        guard let station = annotationView.station else { return }
        presenter.input?.didSelectStationTrigger.send(station)
    }
}
