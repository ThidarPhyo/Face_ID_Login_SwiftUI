//
//  Face_ID_Login_SwiftUIApp.swift
//  Face_ID_Login_SwiftUI
//
//  Created by cmStudent on 2023/09/01.
//

import SwiftUI
import Firebase

@main
struct Face_ID_Login_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(Delegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
// Intializing FIrebase...

class Delegate : NSObject,UIApplicationDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
