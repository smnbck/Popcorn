// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

protocol StoryboardType {
  static var storyboardName: String { get }
}

extension StoryboardType {
  static var storyboard: UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }
}

struct SceneType<T: Any> {
  let storyboard: StoryboardType.Type
  let identifier: String

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }
}

struct InitialSceneType<T: Any> {
  let storyboard: StoryboardType.Type

  func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }
}

protocol SegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
enum StoryboardScene {
  enum BottomMenu: StoryboardType {
    static let storyboardName = "BottomMenu"

    static let bottomMenu = SceneType<Popcorn.BottomMenuViewController>(storyboard: BottomMenu.self, identifier: "BottomMenu")
  }
  enum Introduction: StoryboardType {
    static let storyboardName = "Introduction"

    static let introduction = SceneType<Popcorn.IntroductionViewController>(storyboard: Introduction.self, identifier: "Introduction")
  }
  enum Platforms: StoryboardType {
    static let storyboardName = "Platforms"

    static let initialScene = InitialSceneType<Popcorn.PlatformsViewController>(storyboard: Platforms.self)

    static let platforms = SceneType<Popcorn.PlatformsViewController>(storyboard: Platforms.self, identifier: "platforms")
  }
  enum Preview: StoryboardType {
    static let storyboardName = "Preview"

    static let preview = SceneType<Popcorn.PreviewViewController>(storyboard: Preview.self, identifier: "preview")
  }
  enum TopMenu: StoryboardType {
    static let storyboardName = "TopMenu"

    static let topMenu = SceneType<Popcorn.TopMenuViewController>(storyboard: TopMenu.self, identifier: "TopMenu")
  }
  enum Video: StoryboardType {
    static let storyboardName = "Video"

    static let initialScene = InitialSceneType<Popcorn.VideoViewController>(storyboard: Video.self)
  }
}

enum StoryboardSegue {
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

private final class BundleToken {}
