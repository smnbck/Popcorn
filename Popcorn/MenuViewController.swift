//
//  MenuViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Stored Properties
    var videoViewController: VideoViewController?
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGestureRecognizer()
    }

    private func setupGestureRecognizer() {
        let menuGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.prepareForRemoving))
        menuGestureRecognizer.allowedPressTypes = [NSNumber(value: UIPressType.menu.rawValue)];
        self.view.addGestureRecognizer(menuGestureRecognizer)
    }
    
    func prepareForRemoving() {
        self.videoViewController?.hideMenus()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.removeMenuViewController), userInfo: nil, repeats: false)
    }
    
    @objc private func removeMenuViewController() {
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}

