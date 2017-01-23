// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: nil)
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

struct StoryboardScene {
  enum BottomMenu: String, StoryboardSceneType {
    static let storyboardName = "BottomMenu"

    case bottomMenuScene = "BottomMenu"
    static func instantiateBottomMenu() -> BottomMenuViewController {
      guard let vc = StoryboardScene.BottomMenu.bottomMenuScene.viewController() as? BottomMenuViewController
      else {
        fatalError("ViewController 'BottomMenu' is not of the expected class BottomMenuViewController.")
      }
      return vc
    }
  }
  enum Introduction: String, StoryboardSceneType {
    static let storyboardName = "Introduction"

    case introductionScene = "Introduction"
    static func instantiateIntroduction() -> IntroductionViewController {
      guard let vc = StoryboardScene.Introduction.introductionScene.viewController() as? IntroductionViewController
      else {
        fatalError("ViewController 'Introduction' is not of the expected class IntroductionViewController.")
      }
      return vc
    }
  }
  enum Platforms: String, StoryboardSceneType {
    static let storyboardName = "Platforms"

    static func initialViewController() -> PlatformsViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? PlatformsViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case platformsScene = "platforms"
    static func instantiatePlatforms() -> PlatformsViewController {
      guard let vc = StoryboardScene.Platforms.platformsScene.viewController() as? PlatformsViewController
      else {
        fatalError("ViewController 'platforms' is not of the expected class PlatformsViewController.")
      }
      return vc
    }
  }
  enum Preview: String, StoryboardSceneType {
    static let storyboardName = "Preview"

    case previewScene = "preview"
    static func instantiatePreview() -> PreviewViewController {
      guard let vc = StoryboardScene.Preview.previewScene.viewController() as? PreviewViewController
      else {
        fatalError("ViewController 'preview' is not of the expected class PreviewViewController.")
      }
      return vc
    }
  }
  enum TopMenu: String, StoryboardSceneType {
    static let storyboardName = "TopMenu"

    case topMenuScene = "TopMenu"
    static func instantiateTopMenu() -> TopMenuViewController {
      guard let vc = StoryboardScene.TopMenu.topMenuScene.viewController() as? TopMenuViewController
      else {
        fatalError("ViewController 'TopMenu' is not of the expected class TopMenuViewController.")
      }
      return vc
    }
  }
  enum Video: StoryboardSceneType {
    static let storyboardName = "Video"

    static func initialViewController() -> VideoViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? VideoViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }
  }
}

struct StoryboardSegue {
}
