//
//  HomeMockPresenter.swift
//  MediaMagicTests
//
//  Created by  on 13/10/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import Foundation
@testable import MediaMagic

class HomeMockPresenter: HomeViewPresenterInterface {
    private(set) var showActivityIndicatorCalled = false
    private(set) var hideActivityIndicatorCalled = false
    private(set) var showAlertViewCalled = false
    private(set) var updateCalled = false
    
    func showActivityIndicator() {
        showActivityIndicatorCalled = true
    }
    
    func hideActivityIndicator() {
        hideActivityIndicatorCalled = true
    }
    
    func showAlertView(message: String) {
        showAlertViewCalled = true
    }
    
    func update(photos: [HomeCollectionViewModel]) {
        updateCalled = true
    }
}
