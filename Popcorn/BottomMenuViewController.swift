//
//  SpecificViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class BottomMenuViewController: MenuViewController {
    
    // MARK: - Stored Properties
    
    
    // MARK: - Class Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateMenu()
    }
    
    func animateMenu() {
        UIView.animate(withDuration: 0.2) {
        }
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        print("backbutton pressed")
        prepareForRemoving()
    }
}
