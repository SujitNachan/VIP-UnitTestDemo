//
//  HomeInterfaces.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation

protocol PresenterViewInterface: AnyObject {
    
}

protocol HomeViewControllerInterface: PresenterViewInterface {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showAlertView(message: String)
    func update(photos: [PhotoViewModel])
}

protocol HomeViewInteractorInterface {
    func fetchPhotos()
    func photoDidSelect(photoViewModel: PhotoViewModel)
}

protocol HomeViewPresenterInterface {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showAlertView(message: String)
    func update(photos: [PhotoViewModel])
}

protocol HomeViewRouterInterface {
    func navigateToDetailsScreen(photoViewModel: PhotoViewModel)
}
