//
//  Router.swift
//  NoteApp
//
//  Created by aleksandranavruzova on 18.02.2023.
//

import UIKit

class Router {
  static func showScreen(in window: UIWindow, isLoggedIn: Bool, storyboardID: String) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: storyboardID)
    if let sceneDelegate = window.windowScene?.delegate as? SceneDelegate {
      sceneDelegate.window?.rootViewController = viewController
    }
  }
}
