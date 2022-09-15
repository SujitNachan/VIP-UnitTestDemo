//
//  HomeConfigurator.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation
import UIKit

protocol Configurator {
    func configViewController() -> UIViewController
}

class HomeConfigurator: Configurator {
    func configViewController() -> UIViewController {
        let viewController = HomeViewController()
        let homeViewPresenter = HomeViewPresenter()
        homeViewPresenter.viewController = viewController
        let homeViewRouter = HomeViewRouter()
        let homeService = HomeService()
        let interactor = HomeViewInteractor(presenter: homeViewPresenter, router: homeViewRouter, service: homeService)
        viewController.interactor = interactor
        return viewController
    }
}
