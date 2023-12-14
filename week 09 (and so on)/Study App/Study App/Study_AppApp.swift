//
//  Study_AppApp.swift
//  Study App
//
//  Created by Emily Shen on 11/8/23.
//

import SwiftUI

@main
struct Study_AppApp: App {
    @StateObject var pomodoroModel: PomodoroModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pomodoroModel)
        }
        
    }
}
