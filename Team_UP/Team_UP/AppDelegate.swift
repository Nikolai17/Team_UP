//
//  AppDelegate.swift
//  Team_UP
//
//  Created by Николай Вольников on 04.06.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()

//        window = UIWindow(frame: UIScreen.main.bounds)
//
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewController")
//        self.window?.rootViewController = controller
//        self.window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController(rootViewController: controller)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        UIBarButtonItem.appearance().tintColor = .white
        
        return true
        
//        Auth.auth().addIDTokenDidChangeListener { (auth, user) in
//            if user == nil {
//
//            }
//        }
        
    }
}

