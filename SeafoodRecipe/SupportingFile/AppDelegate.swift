//
//  AppDelegate.swift
//  SeafoodRecipe
//
//  Created by Cindy  Adonia on 25/05/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupNavigationBar()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func setupNavigationBar() {
        let barTintColor = UIColor(hexaRGB: "#e0b169")
        let lineShadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let shadowImage = UIImage()
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = barTintColor
            appearance.shadowColor = lineShadowColor
            appearance.shadowImage = shadowImage
            appearance.backgroundImage = UIImage(named: "navbar-bg")
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor(hexaRGB: "#FFFFFF") as Any,
                .font: UIFont(name: "Futura", size: 17)!
            ]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().setBackgroundImage(UIImage(named: "navbar-bg")!.resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 0, bottom: 0 ,right: 0), resizingMode: .stretch), for: .default)
            UINavigationBar.appearance().barTintColor = UIColor.white
            UINavigationBar.appearance().shadowImage = shadowImage
        }

        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().tintColor = UIColor(hexaRGB: "#FFFFFF")
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(hexaRGB: "#FFFFFF") as Any,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 17)!
        ]
        

        let barButtonAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.clear,
            NSAttributedString.Key.font: UIFont(name: "Futura", size: 0.1)!
        ]
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(barButtonAttributes, for: .highlighted)
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0.0), for: .default)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor(hexaRGB: "#FFFFFF")
        UIApplication.shared.statusBarStyle = .default
    }


}
