//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Felipe Lima on 09/08/23.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
