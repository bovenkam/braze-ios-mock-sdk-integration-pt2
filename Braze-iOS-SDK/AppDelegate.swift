//
//  AppDelegate.swift
//
//  Created by Martijn van de Bovenkamp on 10/03/2022.
//

import UIKit
import AppboyUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let apiKey = "<change to your key>"
        let endpointToUse = "<change to endpoint to use>"
        
        var appboyOptions: [String: Any] {
          return [
            ABKEndpointKey: endpointToUse,
            ABKMinimumTriggerTimeIntervalKey: 10,
            ABKSessionTimeoutKey: 15
          ]
        }
        
        Appboy.start(withApiKey: apiKey, in: application, withLaunchOptions: launchOptions, withAppboyOptions: appboyOptions)
        
        //Add IAM UI delegate here
        
        
        //Add Push Notification code here
        
        return true
    }
    
    
    //Add register device token here
    
    //Add Push handling - didReceiveRemoteNotification here

    //Add Push handling - userNotificationCenter here

  
}

extension AppDelegate: UNUserNotificationCenterDelegate {

    //Add Push handling - willPresent here

    
}

// MARK: - CUSTOM VIEW CONTROLLER LOGIC HERE ABKInAppMessage UI Delegate
extension AppDelegate: ABKInAppMessageUIDelegate {
    func inAppMessageViewControllerWith(_ inAppMessage: ABKInAppMessage) -> ABKInAppMessageViewController? {
    
    switch inAppMessage {
      case is ABKInAppMessageSlideup:
        return SlideUpWithOffsetViewController(inAppMessage: inAppMessage)
      case is ABKInAppMessageModal:
          return ABKInAppMessageModalViewController(inAppMessage: inAppMessage)
      case is ABKInAppMessageFull:
          return ABKInAppMessageFullViewController(inAppMessage: inAppMessage)
      case is ABKInAppMessageHTML:
        return ABKInAppMessageHTMLViewController(inAppMessage: inAppMessage)
      default:
        return ABKInAppMessageViewController(inAppMessage: inAppMessage)
      }
    }
}












