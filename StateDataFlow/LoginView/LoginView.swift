//
//  LoginView.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        TextField("Enter your name", text: $loginViewVM.name)
            .multilineTextAlignment(.center)
        
        Button(action: login) {
            Label("OK", systemImage: "checkmark.circle")
        }
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
            //для сохранения в Юзер Дефаултс
            //@AppStorage
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
