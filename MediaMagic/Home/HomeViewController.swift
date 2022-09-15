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
    private var photos: [Photos] = []
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        interactor?.fetchPhotos()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let screenSize = UIScreen.main.bounds.size.width
        let itemSize = screenSize / 2
        layout.itemSize = CGSize(width: itemSize, height: itemSize + 30)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        if let collectionView = collectionView {
            self.view.addSubview(collectionView)
        }
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
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
    
}

extension HomeViewController: HomeViewControllerInterface {
    func update(photos: [Photos]) {
        self.photos = photos
        DispatchQueue.main.async { [weak self] in
            self?.collectionView?.reloadData()
        }
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if (self.activityView != nil){
                self.activityView?.stopAnimating()
            }
        }
        
    }
    
    func showAlertView() {
        
    }
    
    
}
