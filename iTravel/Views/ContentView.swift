//
//  ContentView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            Spacer()
            CardView(travel: travelData[3])
                .padding()
            Spacer()
            FooterView()
        }
    }
}

#Preview {
    ContentView()
}
