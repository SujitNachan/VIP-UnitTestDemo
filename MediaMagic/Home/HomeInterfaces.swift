//
//  HomeInterfaces.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

protocol HomeViewControllerInterface {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showAlertView()
    func update(photos: [Photos])
}

protocol HomeViewInteractorInterface {
    func fetchPhotos()
}

protocol HomeViewPresenterInterface {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showAlertView()
    func update(photos: [Photos])
}

protocol HomeViewRouterInterface {
    
}
