//
//  ButtonModifier.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Capsule().fill(Color.pink))
            .foregroundColor(Color.white)
    }
}

