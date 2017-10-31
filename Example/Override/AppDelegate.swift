//
//  AppDelegate.swift
//  Override
//
//  Created by Tyler Hillsman on 10/25/17.
//  Copyright © 2017 Tyler Hillsman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize the Override class
        let override = Override()
        
        // Optionally, set your UserDefaults instance (like App Group)
        override.userDefaultsInstance = UserDefaults.standard
        
        // Optionally, but recommended, set initial values to be used for all keys
        override.initialValues = [
            "overrideUrl": "https://tylr.us/testing/override.json",
            "testString": "testing"
        ]
        
        // Pass in the source URL of yoour configuration file. Must be HTTPS.
        override.update(from: "https://tylr.us/testing/override.json") {success in
            // Handle success or failure scenarios
            print(success)
        }
        return true
    }
}

