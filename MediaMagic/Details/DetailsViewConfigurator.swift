//
//  DetailsViewConfigurator.swift
//  MediaMagic
//
//  Created by  on 17/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import UIKit

class DetailsViewConfigurator: Configurator {
    
    private let photoViewModel: PhotoViewModel
    
    init(photoViewModel: PhotoViewModel) {
        self.photoViewModel = photoViewModel
    }
    
    func configViewController() -> UIViewController {
        let detailsViewPresenter = DetailsViewPresenter()
        let detailsViewRouter = DetailsViewRouter()
        let interactor = DetailsViewInteractor(presenter: detailsViewPresenter, router: detailsViewRouter, photoViewModel: self.photoViewModel)
        let viewController = DetailsViewController(interactor: interactor)
        detailsViewPresenter.viewController = viewController
        detailsViewRouter.viewController = viewController
        return viewController
    }
}
