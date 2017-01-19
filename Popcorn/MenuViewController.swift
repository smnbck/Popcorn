//
//  MenuViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: - Stored Properties
    var videoViewController: VideoViewController?
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
    }

    func animateMenu() {
        self.backButton.alpha = 0
        UIView.animate(withDuration: 0.2) { 
            self.backButton.alpha = 1
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        print("backbutton pressed")
        removeMenuViewController()
    }
    
    func removeMenuViewController() {
        self.videoViewController?.hideMenus()
        self.willMove(toParentViewController: nil)
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
}

