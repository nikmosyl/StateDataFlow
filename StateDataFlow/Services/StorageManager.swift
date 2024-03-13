//
//  StorageManager.swift
//  StateDataFlow
//
//  Created by nikita on 09.03.24.
//
import SwiftUI

final class StorageManager {
    
    static let shared = StorageManager()
    
    @AppStorage("currentUser") private var currentUser: Data?
    
    private init() {}
    
    func save(_ user: User) {
        currentUser = try? JSONEncoder().encode(user)
    }
    
    func delete() {
        currentUser = nil
    }
    
    func fetch() -> User {
        guard let currentUser else { return User() }
        let user = try? JSONDecoder().decode(User.self, from: currentUser )
        return user ?? User()
    }
}
