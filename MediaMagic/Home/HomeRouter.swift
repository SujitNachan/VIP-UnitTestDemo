//
//  HomeRouter.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import UIKit

class HomeViewRouter {
    weak var viewController: UIViewController?
}

extension HomeViewRouter: HomeViewRouterInterface {
    func navigateToDetailsScreen(homeCollectionViewModel: HomeCollectionViewModel) {
        let detailsViewConfigurator = DetailsViewConfigurator(homeCollectionViewModel: homeCollectionViewModel)
        self.viewController?.show(detailsViewConfigurator.configViewController(), sender: viewController)
    }
}
