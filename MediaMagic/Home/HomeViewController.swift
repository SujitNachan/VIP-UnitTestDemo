//
//  ViewController.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var interactor: HomeViewInteractorInterface?
    private var activityView: UIActivityIndicatorView?
    private var photos: [HomeCollectionViewModel] = []
    private var alertPresentationCompletion: (() -> Void)?
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "List"
        setupCollectionView()
        interactor?.fetchPhotos()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let screenSize = UIScreen.main.bounds.size.width
        let itemSize = screenSize - 20
        layout.itemSize = CGSize(width: itemSize, height: itemSize * 0.8)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        if let collectionView = collectionView {
            self.view.addSubview(collectionView)
        }
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(HomeCollectionViewCell.self)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.celldata = photos[indexPath.row]
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.photoDidSelect(homeCollectionViewModel: photos[indexPath.row])
    }
}

extension HomeViewController: HomeViewControllerInterface {
    func update(photos: [HomeCollectionViewModel]) {
        self.photos = photos
        self.collectionView?.reloadData()
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator() {
        if (self.activityView != nil){
            self.activityView?.stopAnimating()
        }
        
    }
    
    func showAlertView(message: String) {
        showAlertViewWithStyle(title: "Error", message: message, actionTitles: ["Ok"], handler: [])
    }
}

