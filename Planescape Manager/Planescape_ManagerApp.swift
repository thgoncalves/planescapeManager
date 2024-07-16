//
//  Planescape_ManagerApp.swift
//  Planescape Manager
//
//  Created by Thiago Pinto on 2024-05-15.
//

import SwiftUI
import Firebase

@main
struct Planescape_ManagerApp: App {
    
    init() {
        FirebaseApp.configure()
        print("Firebase configured")
    }
    
    
    @StateObject private var vm = HomeViewModel()
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .navigationBarHidden(true)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .environmentObject(vm)
    }
}
