//
//  ContentView.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    private let contentViewVM = ContentViewViewModel()
    
    var body: some View {
        VStack {
            Text("Hello, \(loginViewVM.user.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(
                action: contentViewVM.buttonDidTapped,
                text: contentViewVM.timerState.rawValue,
                color: .red
            )
            
            Spacer()
            
            ButtonView(
                action: loginViewVM.logout,
                text: "Log Out",
                color: .blue
            )
        }
    }
}

#Preview {
    ContentView().environmentObject(LoginViewViewModel())
}
