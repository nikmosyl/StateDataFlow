//
//  ButtonAppearanceModifier.swift
//  StateDataFlow
//
//  Created by nikita on 13.03.24.
//

import SwiftUI

struct ButtonAppearanceModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 200, height: 60)
            .background(color)
            .clipShape(.rect(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 4)
            )
    }
    
}

extension View {
    func buttonAppearance(_ color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonAppearanceModifier(color: color)
        )
    }
}
