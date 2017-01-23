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
    let defaults = UserDefaults.standard
    @IBOutlet weak var topMenuView: UIVisualEffectView!
    @IBOutlet weak var topMenuViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomMenuView: UIVisualEffectView!
    @IBOutlet weak var bottomMenuViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var toMenuLabel: UILabel!
    
    // MARK: - Stored Properties
    var topMenuGestureRecognizer: UISwipeGestureRecognizer?
    var bottomMenuGestureRecognizer: UISwipeGestureRecognizer?
    var fadeOutTimer: Timer? = Timer()
    var menuIsActive = false
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupGestureRecognizers()
        self.setupTopMenuView()
        self.setupBottomMenuView()
        self.fadeInOverlay()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
    }
    
    func setupGestureRecognizers() {
        self.topMenuGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeToMenu))
        self.topMenuGestureRecognizer?.direction = .down
        self.view.addGestureRecognizer(self.topMenuGestureRecognizer!)
        
        self.bottomMenuGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeTobottomMenu))
        self.bottomMenuGestureRecognizer?.direction = .up
        self.view.addGestureRecognizer(self.bottomMenuGestureRecognizer!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            self.fadeInOverlay()
        }
    }
    
    func setupTopMenuView() {
        let maskImage = UIImage(named: "topviewmask")
        let mask = CALayer()
        
        mask.contents = maskImage?.cgImage
        mask.frame = CGRect(x: 0, y: 0, width: (maskImage?.size.width)!, height: (maskImage?.size.height)!)
        self.topMenuView.layer.mask = mask
        self.topMenuView.layer.masksToBounds = true
    }
    
    func setupBottomMenuView() {
        let maskImage = UIImage(named: "bottomviewmask")
        let mask = CALayer()
        mask.contents = maskImage?.cgImage
        mask.frame = CGRect(x: 0, y: 0, width: (maskImage?.size.width)!, height: (maskImage?.size.height)!)
        self.bottomMenuView.layer.mask = mask
        self.bottomMenuView.layer.masksToBounds = true
    }
    
    func fadeInOverlay() {
        if !self.menuIsActive {
            UIView.animate(withDuration: 0.3, animations: {
                self.topMenuView.alpha = 1
                self.bottomMenuView.alpha = 1
            }) { _ in
                if !self.menuIsActive {
                    self.fadeOutTimer?.invalidate()
                    self.fadeOutTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.fadeOutOverlay), userInfo: nil, repeats: false)
                }
            }
        }
    }
    
    func fadeOutOverlay() {
        if !self.menuIsActive {
            UIView.animate(withDuration: 0.3, animations: {
                self.topMenuView.alpha = 0
                self.bottomMenuView.alpha = 0
            })
        }
    }

    func swipeToMenu() {
        self.prepareForSwipe()
        self.topMenuViewConstraint.constant = 0
        self.bottomMenuViewConstraint.constant = -1080
        
        self.loadTopMenuViewController()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    func loadTopMenuViewController() {
        if let topMenuViewController = StoryboardScene.TopMenu.topMenuScene.viewController() as? TopMenuViewController {
            topMenuViewController.videoViewController = self
            self.addChildViewController(topMenuViewController)
            topMenuViewController.view.frame = CGRect(x: 0, y: 0, width: self.topMenuView.frame.size.width, height: self.topMenuView.frame.size.height)
            self.topMenuView.addSubview(topMenuViewController.view)
            topMenuViewController.didMove(toParentViewController: self)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.toMenuLabel.alpha = 0
            })
        }
    }
    
    func swipeTobottomMenu() {
        self.prepareForSwipe()
        self.bottomMenuViewConstraint.constant = 0
        self.topMenuViewConstraint.constant = -1080
        
        self.loadBottomMenuViewController()
        
        UIView.animate(withDuration: 0.5) {
            
            self.view.layoutIfNeeded()
        }
    }
    
    func loadBottomMenuViewController() {
        if let bottomMenuViewController = StoryboardScene.BottomMenu.bottomMenuScene.viewController() as? BottomMenuViewController {
            bottomMenuViewController.videoViewController = self
            self.addChildViewController(bottomMenuViewController)
            bottomMenuViewController.view.frame = CGRect(x: 0, y: 0, width: self.bottomMenuView.frame.size.width, height: self.bottomMenuView.frame.size.height)
            self.bottomMenuView.addSubview(bottomMenuViewController.view)
            bottomMenuViewController.didMove(toParentViewController: self)
            
            UIView.animate(withDuration: 0.3, animations: {
                self.toMenuLabel.alpha = 0
            })
        }
    }
    
    func prepareForSwipe() {
        self.menuIsActive = true
        self.fadeOutTimer?.invalidate()
        self.fadeOutTimer = nil
        self.view.gestureRecognizers?.forEach(self.view.removeGestureRecognizer)
    }
    
    func hideMenus() {
        self.topMenuViewConstraint.constant = -900
        self.bottomMenuViewConstraint.constant = -900
        UIView.animate(withDuration: 0.5, animations: { 
            self.toMenuLabel.alpha = 1
            self.topMenuView.alpha = 1
            self.bottomMenuView.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            self.menuIsActive = false
            self.fadeOutTimer?.invalidate()
            self.fadeOutTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.fadeOutOverlay), userInfo: nil, repeats: false)
            self.setupGestureRecognizers()
        }
    }
}
