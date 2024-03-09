//
//  StorageManager.swift
//  StateDataFlow
//
//  Created by nikita on 09.03.24.
//
import SwiftUI

final class StorageManager {
    static let shared = StorageManager()
    @AppStorage("currentUser") private var currentUser: String = ""
    
    private init() {}
    
    func login(_ user: User) {
        currentUser = user.name
    }
    
    func logout(_ user: User) {
        currentUser = ""
    }
    
    func getUser() -> User {
        if currentUser.isEmpty {
            User(name: "", isLoggedIn: false)
        } else {
            User(name: currentUser, isLoggedIn: true)
        }
    }
}
