//
//  LoginViewViewModel.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    var name = ""
    @Published var isLoggedIn = false
}
