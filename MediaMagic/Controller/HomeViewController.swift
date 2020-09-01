//
//  ViewController.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    //MARK: Outlet
    @IBOutlet weak var collectionView: UICollectionView!
    lazy var homeViewModel = HomeViewModel(viewModelProtocol: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        homeViewModel.fetchPhotos()
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 35)
        let screenSize = UIScreen.main.bounds.size.width
        let itemSize = (screenSize - 110) / 2
        layout.itemSize = CGSize(width: itemSize, height: itemSize + 30)
        layout.minimumInteritemSpacing = 40
        layout.minimumLineSpacing = 23
        collectionView.collectionViewLayout = layout
    }
    
    override func refreshUI() {
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.celldata = homeViewModel.getPhotoAt(index: indexPath.row)
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}
