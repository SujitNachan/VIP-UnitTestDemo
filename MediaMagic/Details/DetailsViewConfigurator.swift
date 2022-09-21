//
//  DetailsViewConfigurator.swift
//  MediaMagic
//
//  Created by  on 17/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import UIKit

class DetailsViewConfigurator: Configurator {
    
    private let homeCollectionViewModel: HomeCollectionViewModel
    
    init(homeCollectionViewModel: HomeCollectionViewModel) {
        self.homeCollectionViewModel = homeCollectionViewModel
    }
    
    func configViewController() -> UIViewController {
        let detailsViewPresenter = DetailsViewPresenter()
        let detailsViewRouter = DetailsViewRouter()
        let interactor = DetailsViewInteractor(presenter: detailsViewPresenter, router: detailsViewRouter, homeCollectionViewModel: self.homeCollectionViewModel)
        let viewController = DetailsViewController(interactor: interactor)
        detailsViewPresenter.viewController = viewController
        detailsViewRouter.viewController = viewController
        return viewController
    }
}
