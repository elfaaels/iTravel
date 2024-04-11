//
//  FooterView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct FooterView: View {
    @Binding var showBookingAlert: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            Spacer()
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                self.showBookingAlert.toggle()
            }, label: {
                Text("Book Destination".uppercased())
                    .font(.system(.subheadline, design: .monospaced))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                    )
            })
            Spacer()
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .padding()
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 80)) {
    struct PreviewWrapper: View {
            @State var value: Bool = true
            var body: some View {
                FooterView(showBookingAlert: $value)
            }
        }
        return PreviewWrapper()
}
