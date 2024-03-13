//
//  LoginViewViewModel.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    
    @Published var user = StorageManager.shared.fetch()
    
    var nameIsValid: Bool {
        user.name.count > 2
    }
    
    var nameCount: String {
        user.name.count.formatted()
    }
    
    func login() {
        user.isLoggedIn = true
        StorageManager.shared.save(user)
    }
    
    func logout() {
        user.isLoggedIn = false
        user.name = ""
        StorageManager.shared.delete()
    }
}
