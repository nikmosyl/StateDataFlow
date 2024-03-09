//
//  LoginViewViewModel.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    @Published var user = StorageManager.shared.getUser()
    
    func login() {
        if userCheck() {
            user.isLoggedIn = true
            
            StorageManager.shared.login(user)
        }
    }
    
    func logout() {
        user.isLoggedIn = false
        user.name = ""
        
        StorageManager.shared.logout(user)
    }
    func userCheck() -> Bool {
        user.name.count >= 3 ? true : false
    }
}
