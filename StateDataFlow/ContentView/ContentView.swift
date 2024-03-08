//
//  ContentView.swift
//  StateDataFlow
//
//  Created by nikita on 08.03.24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var contentViewVM: ContentViewViewModel
    @EnvironmentObject private var loginViewVM: LoginViewViewModel

    
    var body: some View {
        VStack {
            Text("Hello \(loginViewVM.name)!")
                .padding(.top, 100)
                .font(.largeTitle)
            
            
            Text(contentViewVM.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            
            Spacer()
            
            ButtonView(contentViewVM: contentViewVM)
            
            Spacer()
        }
    }
}

struct ButtonView: View {
    @ObservedObject var contentViewVM: ContentViewViewModel
    
    var body: some View {
        Button(action: contentViewVM.startTimer) {
            Text(contentViewVM.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 4)
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(ContentViewViewModel())
        .environmentObject(LoginViewViewModel())
}
