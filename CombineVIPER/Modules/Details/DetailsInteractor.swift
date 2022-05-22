//
//  DetailsInteractor.swift
//  CombineVIPER
//
//  Created by Varol Aksoy on 22.05.2022.
//

import Foundation

protocol DetailsInteractorInterface: AnyObject {}

protocol DetailsInteractorOutputInterface: AnyObject {}

final class DetailsInteractor {
    var output: DetailsInteractorOutputInterface?
}

extension DetailsInteractor: DetailsInteractorInterface {}
