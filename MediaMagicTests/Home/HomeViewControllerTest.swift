//
//  MediaMagicTests.swift
//  MediaMagicTests
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import XCTest
@testable import MediaMagic

class HomeViewControllerTest: XCTestCase {

    func test_HomeViewController_title() {
        let homeViewController = getHomeViewController()
        homeViewController.title = "Home"
        XCTAssertEqual(homeViewController.title, "Home")
    }
    
    func test_ShowDetailViewOnItemSelect() {
        let homeViewController = getHomeViewController()
        let homeCollectionViewModel = HomeCollectionViewModel(text: "new", imageURL: "abc")
        homeViewController.interactor?.photoDidSelect(homeCollectionViewModel: homeCollectionViewModel)
        RunLoop.current.run(until: Date())
        XCTAssertTrue(homeViewController.isPresentingDetailView)
        
        let detailViewController = homeViewController.navigationController?.topViewController as? DetailsViewController
        detailViewController?.triggerLifecycleIfNeeded()
        XCTAssertEqual(detailViewController?.title, homeCollectionViewModel.text)
    }
    
    func getHomeViewController() -> HomeViewController {
        let navigationController = UINavigationController(rootViewController: HomeConfigurator().configViewController())
        let homeViewController = navigationController.viewControllers.last as? HomeViewController ?? HomeViewController()
        homeViewController.triggerLifecycleIfNeeded()
        return homeViewController
    }
}


extension HomeViewController {
    var isPresentingDetailView: Bool {
        navigationController?.topViewController is DetailsViewController
    }
}

extension DetailsViewController {
    func tapBackButton() {
        navigationItem.leftBarButtonItem?.simulateTap()
        RunLoop.current.run(until: Date())
    }
}

extension UIViewController {
    func triggerLifecycleIfNeeded() {
        guard !isViewLoaded else { return }
        
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
}

extension UIBarButtonItem {
    var systemItem: SystemItem? {
        (value(forKey: "systemItem") as? NSNumber).flatMap { SystemItem(rawValue: $0.intValue) }
    }
    
    func simulateTap() {
        (target as? NSObject)?.perform(action)
    }
}
