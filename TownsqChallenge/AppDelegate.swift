//
//  AppDelegate.swift
//  TownsqChallenge
//
//  Created by Matheus Ramos on 06/08/21.
//

import UIKit
import SwiftUI
import Combine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var coordinator: ProjectCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)

        let container = DependencyFactory()
        let initialCoordinator = container.makeInitialCoordinator()
        
        let rootNC = UINavigationController()
        
        initialCoordinator.start(rootNC)
        
        window?.rootViewController = rootNC
        window?.makeKeyAndVisible()
        
        return true
    }

}


