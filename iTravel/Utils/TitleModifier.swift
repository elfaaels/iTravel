//
//  TitleModifier.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
