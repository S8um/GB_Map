//
//  AppDelegate.swift
//  GB_Map
//
//  Created by admin on 03.06.2021.
//

import UIKit
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        GMSServices.provideAPIKey("AIzaSyCl0j3td_HRbSax3TVPGXZD87s_eJ8rYxM")
        
        return true
    }


}

