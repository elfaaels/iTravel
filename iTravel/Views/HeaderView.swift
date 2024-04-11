//
//  HeaderView.swift
//  iTravel
//
//  Created by Elfana Anamta Chatya on 09/04/24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    
    var body: some View {
        HStack {
            Button {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            Spacer()
            Text("iTRAVEL")
                .font(.system(size: 28, design: .monospaced))
                .fontWeight(.bold)
                .foregroundColor(Color.pink)
            Spacer()
            Button {
                playSound(sound: "sound-click", type: "mp3")
                self.haptics.notificationOccurred(.success)
                self.showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView, content: {
                GuideView()
            })
            .sheet(isPresented: $showInfoView, content: {
             InfoView()
            })
        }
        .padding()
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 80)) {
    struct PreviewWrapper: View {
            @State var value: Bool = true
        @State var flag: Bool = true
            var body: some View {
                HeaderView(showGuideView: $value, showInfoView: $flag)
            }
        }
        return PreviewWrapper()
}
