//
//  junkyardApp.swift
//  junkyard
//
//  Created by Olivia McCallum on 03/05/2023.
//

import SwiftUI

@main
struct junkyardApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            // first view when you open the app
            SplashScreenView()
                .environmentObject(ItemData())
        }
    }
}
