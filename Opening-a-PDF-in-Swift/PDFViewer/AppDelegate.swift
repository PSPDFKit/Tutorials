//
//  AppDelegate.swift
//  PDFViewer
//
//  Created by Julian Grosshauser on 15/07/16.
//  Copyright © 2016 PSPDFKit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Initialize the window.
    var window: UIWindow? = {
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = .whiteColor()
        return window
    }()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Set up the root view controller.
        let viewController = ViewController()
        viewController.title = "PDF Viewer"
        let navigationController = UINavigationController(rootViewController: viewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}
