//
//  ContentView.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import SwiftUI

struct ContentView: View {
    @State var contentViewVM: ContentViewViewModel
    
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    
    var body: some View {
        VStack {
            Text("Hello, \(loginViewVM.user.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
            
            ButtonView(loginViewVM: loginViewVM)
        }
    }
}

struct ButtonView: View {
    
    let action: () -> ()
    let text: String
    let color: Color
    
    init(contentViewVM: ContentViewViewModel) {
        action = contentViewVM.buttonDidTapped
        text = contentViewVM.timerState.rawValue
        color = .red
    }
    
    init(loginViewVM: LoginViewViewModel) {
        action = loginViewVM.logout
        text = "Log Out"
        color = .blue
    }
        
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 4)
        )
    }
}

#Preview {
    ContentView(contentViewVM: ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}
