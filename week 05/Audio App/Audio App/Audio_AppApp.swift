//
//  Audio_AppApp.swift
//  Audio App
//
//  Created by Emily Shen on 10/4/23.
//

import SwiftUI

@main
struct Audio_AppApp: App {
    @StateObject var document = Document()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(document)
        }
    }
}
