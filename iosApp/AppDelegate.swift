//
//  AppDelegate.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 11/01/2024.
//

import UIKit
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ app: UIApplication, open url: URL,
              options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
      var handled: Bool

      handled = GIDSignIn.sharedInstance.handle(url)
      if handled {
        return true
      }

      // Handle other custom URL types.

      // If not handled by this app, return false.
      return false
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Check if a valid token exists
        if let token = UserDefaults.standard.string(forKey: "userAuthToken") {
            // Perform an auto-login with the token
            // If successful, navigate to TabbarViewController
            // If not, show the login screen
            print("Token found")
           
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                       let tabbarVC = storyboard.instantiateViewController(withIdentifier: "tabbar") as! TabbarViewController
                       tabbarVC.modalPresentationStyle = .overFullScreen
                       self.window?.rootViewController = tabbarVC
            
            
        } else {
            // No token found, show the login screen
            print("No Token found")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                      let signUpVC = storyboard.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
                      signUpVC.modalPresentationStyle = .fullScreen
                      self.window?.rootViewController = signUpVC

        }
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


}

