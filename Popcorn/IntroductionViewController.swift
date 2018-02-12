//
//  IntroductionViewController.swift
//  Popcorn
//
//  Created by Simon Back on 23.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var loginButton: UIButton!
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    var transitionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGestureRecognizer()
        loginButton.alpha = 0
    }
    
    func setupGestureRecognizer() {
        self.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.transitionToNextLabel))
        self.view.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    func transitionToNextLabel() {
        if self.transitionCount == 0 {
            self.leadingConstraint.constant = -1400
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (_) in
                self.transitionCount += 1
            })
        } else if transitionCount == 1 {
            self.leadingConstraint.constant = -3060
            UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
                self.loginButton.alpha = 1
            }, completion: { (_) in
                self.view.setNeedsFocusUpdate()
                self.view.updateFocusIfNeeded()
                self.transitionCount += 1
            })
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if self.transitionCount == 2 {
            if let vc = StoryboardScene.Platforms.platforms.instantiate() as? PlatformsViewController {
                self.present(vc, animated: true, completion: {
//                    self.dismiss(animated: true, completion: nil)
                })
            }
        }
    }
}
