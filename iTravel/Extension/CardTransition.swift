//
//  CardTransition.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 11/04/24.
//

import SwiftUI

extension AnyTransition {
    static var traillingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(insertion: .identity, removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
