//
//  HomeInteractor.swift
//  BaseVIPER
//
//  Created by Varol Aksoy on 15.04.2022.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {

}

protocol HomeInteractorOutputInterface: AnyObject {

}

final class HomeInteractor {
    var output: HomeInteractorOutputInterface?
}

extension HomeInteractor: HomeInteractorInterface {

}
