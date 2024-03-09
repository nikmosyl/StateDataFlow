//
//  RootView.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        
        if loginViewVM.user.isLoggedIn {
            ContentView(contentViewVM: ContentViewViewModel())
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(LoginViewViewModel())
}
