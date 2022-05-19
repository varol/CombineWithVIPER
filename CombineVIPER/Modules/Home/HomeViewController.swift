//
//  HomeViewController.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {

}

final class HomeViewController: BaseViewController {
    var presenter: HomePresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension HomeViewController: HomeViewControllerInterface {

}
