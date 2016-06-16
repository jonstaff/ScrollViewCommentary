//
//  AppDelegate.swift
//  ScrollViewCommentary
//
//  Created by Jonathon Staff on 6/16/16.
//  Copyright © 2016 Nplexity LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var rootViewController: UIViewController?

  func application(application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    rootViewController = ViewController()
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = rootViewController
    window?.makeKeyAndVisible()
    return true
  }
}
