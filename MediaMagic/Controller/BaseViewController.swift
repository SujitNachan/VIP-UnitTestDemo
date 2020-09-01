//
//  BaseViewController.swift
//  MediaMagic
//
//  Created by Sujit Nachan on 31/08/20.
//  Copyright © 2020 Sujit Nachan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseViewModelProtocol {
    //MARK: Properties
    var alertPresentationCompletion: (() -> Void)?
    var activityView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func refreshUI() {
        
    }
    
    func showInternalMessage(error: String) {
        showAlertViewWithStyle(title: "Error", message: error, actionTitles: ["Ok"], handler: [])
    }
    
    func showActivityIndicator() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }
    
    func hideActivityIndicator() {
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    func showAlertViewWithStyle(title: String, message: String, actionTitles: [String], style: UIAlertController.Style = .alert, handler: [((UIAlertAction) -> Void)?]) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        for (index, title) in actionTitles.enumerated() {
            // add an action (button)
            alert.addAction(UIAlertAction(title: title, style: .default, handler: handler[index]))
        }
        if style == .actionSheet {
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        }
        // show the alert
        self.present(alert, animated: true, completion: alertPresentationCompletion)
    }
}

