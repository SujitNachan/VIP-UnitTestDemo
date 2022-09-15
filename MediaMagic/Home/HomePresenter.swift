//
//  HomePresenter.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

class HomeViewPresenter {
    var viewController: HomeViewControllerInterface?
}

extension HomeViewPresenter: HomeViewPresenterInterface {
    func update(photos: [Photos]) {
        viewController?.update(photos: photos)
    }
    
    func showActivityIndicator() {
        viewController?.showActivityIndicator()
    }
    
    func hideActivityIndicator() {
        viewController?.hideActivityIndicator()
    }
    
    func showAlertView() {
        viewController?.showAlertView()
    }
    
    
}
