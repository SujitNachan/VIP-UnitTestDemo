//
//  HomeInteractorTest.swift
//  MediaMagicTests
//
//  Created by  on 13/10/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import XCTest
@testable import MediaMagic

class HomeViewInteractorTest: XCTestCase {
    private var interacator: HomeViewInteractor?
    private let presenter = HomeMockPresenter()
    private let router = HomeMockRouter()
    
    override func setUp() {
        super.setUp()
        interacator = HomeViewInteractor(presenter: presenter, router: router, service: HomeMockService())
    }
    
    func testFetchPhotoSucess() {
        interacator?.fetchPhotos()
        XCTAssertTrue(presenter.updateCalled)
    }
    
    func testActivityIndicatorIsVisible() {
        interacator?.fetchPhotos()
        XCTAssertTrue(presenter.showActivityIndicatorCalled)
    }
    
    func testActivityIndicatorIshide() {
        interacator?.fetchPhotos()
        XCTAssertTrue(presenter.hideActivityIndicatorCalled)
    }
    
    func testFetchPhotoFailure() {
        let mockService = HomeMockService(shouldFailed: true)
        interacator = HomeViewInteractor(presenter: presenter, router: router, service: mockService)
        interacator?.fetchPhotos()
        XCTAssertTrue(presenter.showAlertViewCalled)
    }
    
    func testNavigateToDetailsScreen() {
        interacator?.photoDidSelect(homeCollectionViewModel: HomeCollectionViewModel(text: "text", imageURL: "imageURL"))
        XCTAssertTrue(router.navigateToDetailsScreen)
    }
}
