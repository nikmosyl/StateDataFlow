//
//  StateDataFlowApp.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import SwiftUI

@main
struct StateDataFlowApp: App {
    @StateObject private var loginViewVM = LoginViewViewModel()
    @StateObject private var contentViewVM  = ContentViewViewModel()

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .environmentObject(loginViewVM)
        .environmentObject(contentViewVM)
    }
}
