//
//  VideoViewController.swift
//  Popcorn
//
//  Created by Simon Back on 18.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class VideoViewController: UIViewController {
    
    // MARK: - Constraints
    @IBOutlet weak var menuView: UIVisualEffectView!
    @IBOutlet weak var menuViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var specificView: UIVisualEffectView!
    @IBOutlet weak var specificViewBottomConstraint: NSLayoutConstraint!
    
    
    // MARK: - Stored Properties
    var menuGestureRecognizer: UISwipeGestureRecognizer?
    var specificGestureRecognizer: UISwipeGestureRecognizer?
    var fadeOutTimer: Timer? = Timer()
    var menuIsActive = false
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGestureRecognizers()
        self.setupMenuView()
        self.setupSpecificView()
    }
    
    func setupGestureRecognizers() {
        self.menuGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeToMenu))
        self.menuGestureRecognizer?.direction = .down
        self.view.addGestureRecognizer(self.menuGestureRecognizer!)
        
        self.specificGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeToSpecific))
        self.specificGestureRecognizer?.direction = .up
        self.view.addGestureRecognizer(self.specificGestureRecognizer!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            self.fadeInOverlay()
        }
    }
    
    func setupMenuView() {
            self.menuView.alpha = 0
    }
    
    func setupSpecificView() {
        self.specificView.alpha = 0
    }
    
    func fadeInOverlay() {
        if !self.menuIsActive {
            UIView.animate(withDuration: 0.2, animations: {
                self.menuView.alpha = 1
                self.specificView.alpha = 1
            }) { _ in
                if !self.menuIsActive {
                    self.fadeOutTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.fadeOutOverlay), userInfo: nil, repeats: false)
                }
            }
        }
    }
    
    func fadeOutOverlay() {
        if !self.menuIsActive {
            UIView.animate(withDuration: 0.2, animations: {
                self.menuView.alpha = 0
                self.specificView.alpha = 0
            })
        }
    }

    func swipeToMenu() {
        self.prepareForSwipe()
        self.menuViewTopConstraint.constant = 0
        UIView.animate(withDuration: 0.5, animations: { 
            self.specificView.alpha = 0
            self.view.layoutIfNeeded()
        }) { _ in
            self.loadMenuViewController()
        }
    }
    
    func loadMenuViewController() {
        if let menuViewController = StoryboardScene.Menu.menuScene.viewController() as? MenuViewController {
            menuViewController.videoViewController = self
            self.addChildViewController(menuViewController)
            menuViewController.view.frame = CGRect(x: 0, y: 0, width: self.menuView.frame.size.width, height: self.menuView.frame.size.height)
            self.menuView.addSubview(menuViewController.view)
            menuViewController.didMove(toParentViewController: self)
        }
    }
    
    func swipeToSpecific() {
        self.prepareForSwipe()
        self.specificViewBottomConstraint.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.menuView.alpha = 0
            self.view.layoutIfNeeded()
        }
    }
    
    func prepareForSwipe() {
        self.menuIsActive = true
        self.fadeOutTimer?.invalidate()
        self.fadeOutTimer = nil
        self.view.gestureRecognizers?.forEach(self.view.removeGestureRecognizer)
    }
}
