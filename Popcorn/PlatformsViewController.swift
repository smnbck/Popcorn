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
    var activePlatformsArray: [Bool] = []
    let defaults = UserDefaults.standard
//    var mediaStreamArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let servicesArray = ServicesArray()
        self.services = servicesArray.services
        self.finishButton.isEnabled = false
        
        if let activeVideosArray = defaults.array(forKey: "activeVideos") as? [Int] {
            ActiveVideos.sharedInstance.activeVideos = activeVideosArray
        } else {
            self.defaults.setValue(ActiveVideos.sharedInstance.activeVideos, forKey: "activeVideos")
        }
        
        if let activeStationsArray = defaults.array(forKey: "activeStations") as? [Int] {
            ActiveStations.sharedInstance.activeStations = activeStationsArray
        } else {
            self.defaults.setValue(ActiveStations.sharedInstance.activeStations, forKey: "activeStations")
        }
        
        if let activePlatformsArray = defaults.array(forKey: "activePlatforms") as? [Bool] {
            self.activePlatformsArray = activePlatformsArray
        } else {
            self.activePlatformsArray = [false, false, false, false, false, false, false]
            self.defaults.setValue(activePlatformsArray, forKey: "activePlatforms")
        }
        
        var activePlatformCounter = 0
        for i in 0..<activePlatformsArray.count {
            if activePlatformsArray[i] {
                activePlatformCounter += 1
            }
        }
        if activePlatformCounter > 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.finishButton.alpha = 1
                self.finishButton.setTitle("Fertig", for: .highlighted)
                self.finishButton.setTitle("Fertig", for: .normal)
                self.finishButton.setTitle("Fertig", for: .focused)
            })
            self.finishButton.isEnabled = true
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.finishButton.alpha = 0.3
                self.finishButton.setTitle("Wähle mindestens eine Videoplattform", for: .highlighted)
                self.finishButton.setTitle("Wähle mindestens eine Videoplattform", for: .normal)
                self.finishButton.setTitle("Wähle mindestens eine Videoplattform", for: .focused)
            })
            self.finishButton.isEnabled = false
        }
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
        if defaults.bool(forKey: "setupFinished") {
            self.dismiss(animated: true, completion: nil)
        } else {
            defaults.set(true, forKey: "setupFinished")
            let vc = StoryboardScene.Video.initialViewController()
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath)
        if let serviceCell = cell as? PlatformsTableViewCell {
            serviceCell.serviceLogo.image = UIImage(named: services[indexPath.row].logoName)
            serviceCell.serviceName.text = services[indexPath.row].name
            
            if let videoService = services[indexPath.row] as? VideoService {
                
                serviceCell.serviceDescription.text = calculateShowsAndMoviesForService(movieIDs: videoService.movieIDs, seriesIDs: videoService.seriesIDs)
                
                
            } else if let videoService = services[indexPath.row] as? TVService {
                var numberOfStations = 0
                if indexPath.row == 3 {
                    numberOfStations = 17
                } else if indexPath.row == 4 {
                    numberOfStations = 7
                } else if indexPath.row == 5 {
                    numberOfStations = 6
                } else if indexPath.row == 6 {
                    numberOfStations = 6
                }
//                let numberOfStations = videoService.stationsIDs.count
                let numberOfVideos = videoService.numberOfVideos
                serviceCell.serviceDescription.text = "\(numberOfStations) neue TV Sender und \(numberOfVideos) neue Videos für deine Mediathek"
            }
            
            if activePlatformsArray[indexPath.row] {
                serviceCell.actionButton.image = UIImage(named: "checkIcon")
                serviceCell.serviceDescription.text = "Bereits hinzugefügt"
            }
            
            if indexPath.row == 0 && !self.tableViewLoaded {
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
                if activePlatformsArray[prevIndexPath.row] {
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
                if activePlatformsArray[nextIndexPath.row] {
                    nextCell.actionButton.image = UIImage(named: "removeIcon")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PlatformsTableViewCell {
            if !activePlatformsArray[indexPath.row] {
                cell.serviceDescription.text = "Bereits hinzugefügt"
                cell.actionButton.image = UIImage(named: "removeIcon")
                activePlatformsArray[indexPath.row] = !activePlatformsArray[indexPath.row]
                if indexPath.row <= 2{
                    if let selectedService = services[indexPath.row] as? VideoService {
                        for i in 0..<selectedService.movieIDs.count {
                            ActiveVideos.sharedInstance.activeVideos.append(selectedService.movieIDs[i])
                        }
                        for i in 0..<selectedService.seriesIDs.count {
                            ActiveVideos.sharedInstance.activeVideos.append(selectedService.seriesIDs[i])
                        }
                    }
                } else {
                    if let selectedService = services[indexPath.row] as? TVService {
                        for i in 0..<selectedService.stationsIDs.count {
                            ActiveStations.sharedInstance.activeStations.append(selectedService.stationsIDs[i])
                        }
                    }
                }
                
            } else {
                cell.actionButton.image = UIImage(named: "addIcon")
                activePlatformsArray[indexPath.row] = !activePlatformsArray[indexPath.row]
                if indexPath.row <= 2 {
                    
                    if let selectedService = services[indexPath.row] as? VideoService {
                        for i in 0..<selectedService.movieIDs.count {
                            for j in 0..<ActiveVideos.sharedInstance.activeVideos.count {
                                if ActiveVideos.sharedInstance.activeVideos[j] == selectedService.movieIDs[i] {
                                    ActiveVideos.sharedInstance.activeVideos.remove(at: j)
                                    break
                                }
                            }
                        }
                        for i in 0..<selectedService.seriesIDs.count {
                            for j in 0..<ActiveVideos.sharedInstance.activeVideos.count {
                                if ActiveVideos.sharedInstance.activeVideos[j] == selectedService.seriesIDs[i] {
                                    ActiveVideos.sharedInstance.activeVideos.remove(at: j)
                                    break
                                }
                            }
                        }
                        ///////////
                    }
                } else {
                    if let selectedService = services[indexPath.row] as? TVService {
                        
                        var numberOfStations = 0
                        if indexPath.row == 3 {
                            numberOfStations = 17
                        } else if indexPath.row == 4 {
                            numberOfStations = 7
                        } else if indexPath.row == 5 {
                            numberOfStations = 6
                        } else if indexPath.row == 6 {
                            numberOfStations = 6
                        }
                        let numberOfVideos = selectedService.numberOfVideos
                        cell.serviceDescription.text = "\(numberOfStations) neue TV Sender und \(numberOfVideos) neue Videos für deine Mediathek"
                        
                        for i in 0..<selectedService.stationsIDs.count {
                            for j in 0..<ActiveStations.sharedInstance.activeStations.count {
                                if ActiveStations.sharedInstance.activeStations[j] == selectedService.stationsIDs[i] {
                                    ActiveStations.sharedInstance.activeStations.remove(at: j)
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }
        
        for i in 0...2 {
            if !activePlatformsArray[i] {
                if let videoService = services[i] as? VideoService {
                    if let videoCell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) as? PlatformsTableViewCell {
                        videoCell.serviceDescription.text = calculateShowsAndMoviesForService(movieIDs: videoService.movieIDs, seriesIDs: videoService.seriesIDs)
                    }
                }
            }
        }
        
        // we save the shared instances into user defaults
        self.defaults.setValue(ActiveStations.sharedInstance.activeStations, forKey: "activeStations")
        self.defaults.setValue(ActiveVideos.sharedInstance.activeVideos, forKey: "activeVideos")
        self.defaults.setValue(activePlatformsArray, forKey: "activePlatforms")
        //
        
        var numberOfActiveServices = 0
        for i in 0..<activePlatformsArray.count {
            if activePlatformsArray[i] {
                numberOfActiveServices += 1
            }
        }
        if numberOfActiveServices > 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.finishButton.alpha = 1
                self.finishButton.setTitle("Fertig", for: .highlighted)
                self.finishButton.setTitle("Fertig", for: .normal)
                self.finishButton.setTitle("Fertig", for: .focused)
            })
            self.finishButton.isEnabled = true
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.finishButton.alpha = 0.3
                self.finishButton.setTitle("Wähle mindestens eine Videoplattform", for: .highlighted)
                self.finishButton.setTitle("Wähle mindestens eine Videoplattform", for: .normal)
                self.finishButton.setTitle("Wähle mindestens eine Videoplattform", for: .focused)
            })
            self.finishButton.isEnabled = false
        }
    }
    
    func calculateShowsAndMoviesForService(movieIDs: [Int], seriesIDs: [Int]) -> String {
        var numberOfMovies = movieIDs.count
        var numberOfSeries = seriesIDs.count
        
        for i in 0..<movieIDs.count {
            for j in 0..<ActiveVideos.sharedInstance.activeVideos.count {
                if movieIDs[i] == ActiveVideos.sharedInstance.activeVideos[j] {
                    numberOfMovies -= 1
                    break
                }
            }
        }
        
        for i in 0..<seriesIDs.count {
            for j in 0..<ActiveVideos.sharedInstance.activeVideos.count {
                if seriesIDs[i] == ActiveVideos.sharedInstance.activeVideos[j] {
                    numberOfSeries -= 1
                    break
                }
            }
        }
        
        var text = "\(numberOfMovies) neue Filme und \(numberOfSeries) neue Serien für deine Mediathek"
        if numberOfMovies == 1 {
            text = text.replacingOccurrences(of: "1 neue Filme", with: "ein neuer Film")
        } else if numberOfMovies == 0 {
            text = text.replacingOccurrences(of: "0 neue Filme", with: "keine neuen Filme")
        }
        if numberOfSeries == 1 {
            text = text.replacingOccurrences(of: "1 neue Serien", with: "eine neue Serie")
        } else if numberOfSeries == 0 {
            text = text.replacingOccurrences(of: "0 neue Serien", with: "keine neuen Serien")
        }
        
        return text
    }
}
