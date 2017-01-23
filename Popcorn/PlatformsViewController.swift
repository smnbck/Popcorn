//
//  PlatformsViewController.swift
//  Popcorn
//
//  Created by Simon Back on 21.01.17.
//  Copyright © 2017 Simon Back. All rights reserved.
//

import UIKit

class PlatformsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var services: [Service] = []
    var tableViewLoaded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let servicesArray = ServicesArray()
        self.services = servicesArray.services
    }

    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView == self.finishButton {
            
            UIView.animate(withDuration: 0.2, animations: { 
                self.finishButton.titleLabel?.font = self.finishButton.titleLabel?.font.withSize(44)
            })
        }
        
        if context.previouslyFocusedView == self.finishButton {
            
            UIView.animate(withDuration: 0.2, animations: {
                self.finishButton.titleLabel?.font = self.finishButton.titleLabel?.font.withSize(36)
                self.finishButton.imageView?.tintColor = UIColor.white
            })
        }
    }
    
    @IBAction func finishButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)
        if let serviceCell = cell as? PlatformsTableViewCell {
//            serviceCell.bgView.alpha = 0
//            serviceCell.bgView.layer.cornerRadius = 6
            serviceCell.serviceLogo.image = UIImage(named: services[indexPath.row].logoName)
            serviceCell.serviceName.text = services[indexPath.row].name
            
            if let videoService = services[indexPath.row] as? VideoService {
                let numberOfMovies = videoService.numberOfMovies
                let numberOfSeries = videoService.numberOfSeries
                serviceCell.serviceDescription.text = "\(numberOfMovies) neue Filme und \(numberOfSeries) neue Serienstaffeln für deine Mediathek"
            } else if let videoService = services[indexPath.row] as? TVService {
                let numberOfStations = videoService.numberOfStations
                let numberOfVideos = videoService.numberOfVideos
                serviceCell.serviceDescription.text = "\(numberOfStations) neue TV Sender und \(numberOfVideos) neue Videos für deine Mediathek"
            }
            
            if services[indexPath.row].activated {
                serviceCell.actionButton.image = UIImage(named: "checkIcon")
            }
            
            if indexPath.row == 0 && !self.tableViewLoaded {
//                serviceCell.bgView.alpha = 0.75
                serviceCell.serviceName.textColor = ColorName.orange.color
                serviceCell.serviceDescription.textColor = ColorName.orange.color
                serviceCell.actionButton.tintColor = ColorName.orange.color
                self.tableViewLoaded = true
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if let prevIndexPath = context.previouslyFocusedIndexPath {
            let prevCell = tableView.cellForRow(at: prevIndexPath)
            if let prevCell = prevCell as? PlatformsTableViewCell {
                prevCell.serviceName.textColor = UIColor.white
                prevCell.serviceDescription.textColor = UIColor.white
                prevCell.actionButton.tintColor = UIColor.white
//                prevCell.bgView.alpha = 0
                tableView.deselectRow(at: prevIndexPath, animated: false)
                if services[prevIndexPath.row].activated {
                    prevCell.actionButton.image = UIImage(named: "checkIcon")
                } else {
                    prevCell.actionButton.image = UIImage(named: "addIcon")
                }
            }
        }
        
        if let nextIndexPath = context.nextFocusedIndexPath {
            let nextCell = tableView.cellForRow(at: nextIndexPath)
            if let nextCell = nextCell as? PlatformsTableViewCell {
                nextCell.serviceName.textColor = ColorName.orange.color
                nextCell.serviceDescription.textColor = ColorName.orange.color
                nextCell.actionButton.tintColor = ColorName.orange.color
//                nextCell.bgView.alpha = 0.75
                tableView.selectRow(at: nextIndexPath, animated: false, scrollPosition: .none)
                if services[nextIndexPath.row].activated {
                    nextCell.actionButton.image = UIImage(named: "checkIcon")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
