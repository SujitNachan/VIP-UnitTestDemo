//
//  HomeCollectionViewCell.swift
//  MediaMagic
//
//  Created by  on 15/09/22.
//  Copyright © 2022 Sujit Nachan. All rights reserved.
//

import UIKit

protocol HomeCollectionViewCellData {
    var imageURL: String? { get }
    var text: String? { get }
}


class HomeCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    private var cornerRadius: CGFloat = 5.0
    
    //MARK: Outlet
    @IBOutlet weak var imgView: CustomImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelContainerView: UIView!
    
    var celldata: HomeCollectionViewCellData? {
        didSet {
            imgView.loadImage(urlString: celldata?.imageURL)
            label.text = celldata?.text
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Apply rounded corners to contentView
        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = true
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = false
        
        // Apply a shadow
        layer.shadowRadius = 8.0
        layer.shadowOpacity = 0.20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5)
        labelContainerView.applyBlurEffect()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Improve scrolling performance with an explicit shadowPath
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: cornerRadius
        ).cgPath
    }
}

extension UIView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(blurEffectView, at: 0)
    }
}
