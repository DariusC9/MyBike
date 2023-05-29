//
//  MyBikeApp.swift
//  MyBike
//
//  Created by Darius Couti on 29.05.2023.
//

import SwiftUI

@main
struct MyBikeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
