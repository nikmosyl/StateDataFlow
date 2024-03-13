//
//  ButtonView.swift
//  StateDataFlow
//
//  Created by nikita on 13.03.24.
//

import SwiftUI

struct ButtonView: View {
    
    let action: () -> ()
    let text: String
    let color: Color
        
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
        }
        .buttonAppearance(color)
    }
}

struct ActionButton_Previews: PreviewProvider {
    static var previews: some View{
        ButtonView(action: {}, text: "Test", color: .green)
    }
}
