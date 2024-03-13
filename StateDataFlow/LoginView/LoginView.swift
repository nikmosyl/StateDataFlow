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
        ZStack {
            TextField("Enter your name", text: $loginViewVM.user.name)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                Text("\(loginViewVM.nameCount)")
                    .foregroundStyle(loginViewVM.nameIsValid ? .green : .red)
            }
        }
        .padding()
        
        Button(action: loginViewVM.login) {
            Label("OK", systemImage: "checkmark.circle")
        }
        .disabled(!loginViewVM.nameIsValid)
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
