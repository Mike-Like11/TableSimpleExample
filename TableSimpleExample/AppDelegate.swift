//
//  AppDelegate.swift
//  TableSimpleExample
//
//  Created by Mike I on 19.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
               window?.makeKeyAndVisible()
        
        window?.makeKeyAndVisible()
        return true
    }

   


}

