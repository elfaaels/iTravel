//
//  ContentView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct ContentView: View {
    @State var alert: Bool = false
    @State var guideFlag: Bool = false

    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $guideFlag)
            Spacer()
            CardView(travel: travelData[3])
                .padding()
            Spacer()
            FooterView(showBookingAlert: $alert)
        }
        .alert(isPresented: $alert, content: {
            Alert(title: Text("SUCCESS"), message: Text("Enjoy your next trip!"), dismissButton: .default(Text("OK")))
        })
    }
}

#Preview {
    ContentView()
}
